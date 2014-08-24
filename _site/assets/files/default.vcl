# Combined VCL for all Bigdino and CoG vhosts

# Backend info 
backend default {
	.host = "209.157.174.11";
	.port = "80";
	.connect_timeout = 600s;
	.first_byte_timeout = 600s;
	.between_bytes_timeout = 600s;
	.max_connections = 800;
}

# Import Varnish Standard Module so I can serve custom error pages
import std;

# Set who is allowed to purge
acl purge {
	"localhost";
	"10.128.12.0"/24;
	"10.128.33.0"/24;
}

sub vcl_recv {
	if (req.request == "POST") {
		return (pass);
	}

	# In the event of a backend overload (HA!), serve stale objects for up to two minutes
	set req.grace = 2m;

	# Ignore all traffic to *host*
	#if (req.http.host ~"host") {
	#	return (pass);
	#}

	# Set Vanilla stuff to always pass
	#if (req.url ~ "/plugin/imonline") {
	#	return (pass);
	#}
	#if (req.url ~ "/settings/analyticstick.json") {
	#	return (pass);
	#}
	#if (req.url ~ "/dashboard/notifications/inform") {
	#	return (pass);
	#}

	# Ignore regx
	#if (req.url ~ "/markers.json(\?[0-9]+)?$") {
	#	return (pass);
	#}

	# Remove cookies from things that should be static, if any are set
	if (req.url ~ "(?i)\.(png|gif|jpeg|jpg|ico|swf|css|js|html|htm|woff|ttf|eot|svg)(\?[a-zA-Z0-9\=\.\-]+)?$") {
		remove req.http.Cookie;
	}

	# allow PURGE from localhost
	if (req.request == "PURGE") {
		if (!client.ip ~ purge) {
			error 405 "Not allowed.";
		}
		return (lookup);
	}

	# Wordpress stuff
	if (req.http.host ~ "www.federalreservebanksf.org") {
		if (req.url ~ "wp-(login|admin)") {
			return (pass);
		}
	}

	# Added by me to see if I can force Varnish to use X-Forwarded-For
	remove req.http.X-Forwarded-For;
	#set req.http.X-Forwarded-For = req.http.rlnclientipaddr;
	set req.http.X-Forwarded-For = client.ip;

	# Remove Google Analytics and Piwik cookies so pages can be cached
	if (req.http.Cookie) {
		set req.http.Cookie = regsuball(req.http.Cookie, "(^|;\s*)(__[a-z]+|has_js)=[^;]*", "");
		set req.http.Cookie = regsuball(req.http.Cookie, "(^|;\s*)(_pk_(ses|id)[\.a-z0-9]*)=[^;]*", "");
	}
	if (req.http.Cookie == "") {
		remove req.http.Cookie;
	}
}

sub vcl_pass {
	set bereq.http.connection = "close";
	# Fix broken behavior showing tons of requests from 127.0.0.1 with Vanilla forums
	if (req.http.X-Forwarded-For) {
		set bereq.http.X-Forwarded-For = req.http.X-Forwarded-For;
	} else {
		set bereq.http.X-Forwarded-For = regsub(client.ip, ":.*", "");
	}
}

sub vcl_pipe {
	set bereq.http.connection = "close";
	# Fix broken behavior showing tons of requests from 127.0.0.1 with Vanilla forums
	if (req.http.X-Forwarded-For) {
		set bereq.http.X-Forwarded-For = req.http.X-Forwarded-For;
	} else {
        	set bereq.http.X-Forwarded-For = regsub(client.ip, ":.*", "");
	}
}

sub vcl_fetch {
	set beresp.grace = 2m;

	if (req.http.host ~ "www.federalreservebanksf.org") {
		if (!(req.url ~ "wp-(login|admin)")) {
			remove beresp.http.set-cookie;
		}
	}

	# Strip cookies before static items are inserted into cache.
	if (req.url ~ "\.(png|gif|jpg|swf|css|js|ico|html|htm|woff|eof|ttf|svg)$") {
		remove beresp.http.set-cookie;
	}

	# Adjusting Varnish's caching - hold on to all cachable objects fo 24 hours.
	# Objects declared explicibly as uncacheable are held for 60 seconds, which
	# helps in the event of a sudden ridiculous rush of traffic.
	# Initial exceptions are set for the CoG content, which should be cached
	# essentially forever, and the Overviewer map stuff.
	if (req.http.host ~ "www.federalreservebanksf.org") {
		set beresp.ttl = 1008h;
	}
	# stuff that changes more offten
	elseif (req.url ~ "newstuff") {
		set beresp.ttl = 120s;
	}
	# everything else gets 24h unless it says no-cache
	else {
		if (beresp.ttl < 24h) {
			if (beresp.http.Cache-Control ~ "(private|no-cache|no-store)") {
				set beresp.ttl = 60s;
			}
			else {
				set beresp.ttl = 24h;
			}

		}
	}

	if (beresp.ttl <= 0s) {
  	set beresp.http.X-Cacheable = "NO:Not Cacheable";
	}
}

# allow to purge based on acl
sub vcl_hit {
	if (req.request == "PURGE") {
		purge;
		error 200 "Purged.";
	}
}

# allow to purge based on acl
sub vcl_miss {
	if (req.request == "PURGE") {
		purge;
		error 200 "Purged.";
	}
}

sub vcl_deliver {
	# Display hit/miss info
	if (obj.hits > 0) {
		set resp.http.X-Cache = "HIT";
		set resp.http.X-Cache-Hits = obj.hits;
	}
	else {
		set resp.http.X-Cache = "MISS";
		set resp.http.X-Cache-Hits = obj.hits;
	}

	# Remove the Varnish header
	remove resp.http.X-Varnish;
	remove resp.http.Server;
	remove resp.http.X-Powered-By;
	remove resp.http.Via;

	# Display my header
	#set resp.http.X-Are-Dinosaurs-Awesome = "HELL YES";

	# Remove custom error header
	remove resp.http.MyError;
	return (deliver);
}

sub vcl_error {
	set obj.http.Content-Type = "text/html; charset=utf-8";
	set obj.http.MyError = std.fileread("/var/www/error/varnisherr.html");
	synthetic obj.http.MyError;
	return(deliver);
}


# 
# Below is a commented-out copy of the default VCL logic.  If you
# redefine any of these subroutines, the built-in logic will be
# appended to your code.
# sub vcl_recv {
#	 if (req.restarts == 0) {
# 	if (req.http.x-forwarded-for) {
# 		set req.http.X-Forwarded-For =
# 		req.http.X-Forwarded-For + ", " + client.ip;
# 	} else {
# 		set req.http.X-Forwarded-For = client.ip;
# 	}
#	 }
#	 if (req.request != "GET" &&
#	   req.request != "HEAD" &&
#	   req.request != "PUT" &&
#	   req.request != "POST" &&
#	   req.request != "TRACE" &&
#	   req.request != "OPTIONS" &&
#	   req.request != "DELETE") {
#		 /* Non-RFC2616 or CONNECT which is weird. */
#		 return (pipe);
#	 }
#	 if (req.request != "GET" && req.request != "HEAD") {
#		 /* We only deal with GET and HEAD by default */
#		 return (pass);
#	 }
#	 if (req.http.Authorization || req.http.Cookie) {
#		 /* Not cacheable by default */
#		 return (pass);
#	 }
#	 return (lookup);
# }
# 
# sub vcl_pipe {
#	 # Note that only the first request to the backend will have
#	 # X-Forwarded-For set.  If you use X-Forwarded-For and want to
#	 # have it set for all requests, make sure to have:
#	 # set bereq.http.connection = "close";
#	 # here.  It is not set by default as it might break some broken web
#	 # applications, like IIS with NTLM authentication.
#	 return (pipe);
# }
# 
# sub vcl_pass {
#	 return (pass);
# }
# 
# sub vcl_hash {
#	 hash_data(req.url);
#	 if (req.http.host) {
#		 hash_data(req.http.host);
#	 } else {
#		 hash_data(server.ip);
#	 }
#	 return (hash);
# }
# 
# sub vcl_hit {
#	 return (deliver);
# }
# 
# sub vcl_miss {
#	 return (fetch);
# }
# 
# sub vcl_fetch {
#	 if (beresp.ttl <= 0s ||
#		 beresp.http.Set-Cookie ||
#		 beresp.http.Vary == "*") {
# 		/*
# 		 * Mark as "Hit-For-Pass" for the next 2 minutes
# 		 */
# 		set beresp.ttl = 120 s;
# 		return (hit_for_pass);
#	 }
#	 return (deliver);
# }
# 
# sub vcl_deliver {
#	 return (deliver);
# }
# 
# sub vcl_error {
#	 set obj.http.Content-Type = "text/html; charset=utf-8";
#	 set obj.http.Retry-After = "5";
#	 synthetic {"
# <?xml version="1.0" encoding="utf-8"?>
# <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
#  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
# <html>
#   <head>
#	 <title>"} + obj.status + " " + obj.response + {"</title>
#   </head>
#   <body>
#	 <h1>Error "} + obj.status + " " + obj.response + {"</h1>
#	 <p>"} + obj.response + {"</p>
#	 <h3>Guru Meditation:</h3>
#	 <p>XID: "} + req.xid + {"</p>
#	 <hr>
#	 <p>Varnish cache server</p>
#   </body>
# </html>
# "};
#	 return (deliver);
# }
# 
# sub vcl_init {
# 	return (ok);
# }
# 
# sub vcl_fini {
# 	return (ok);
# }
