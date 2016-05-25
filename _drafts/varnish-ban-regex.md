# config

sub vcl_backend_response {
   set beresp.http.x-url = bereq.url;
}

sub vcl_deliver {
   # The X-Url header is for internal use only
   unset resp.http.x-url;
}

 
 
sub vcl_recv {
  if (req.method == "PURGE") {
    if (!client.ip ~ purge) {
      return(synth(405,"Not allowed."));
    }
    return (purge);
  }

  if (req.method == "BAN") {
    ban("obj.http.x-url ~ " + req.http.x-ban);
    return(synth(200, "Ban added: " + req.http.x-ban ));
  }

}
 
# examples

Fetch into varnish:
curl -s -D - "http://localhost:6081/path/to/resource.jpg?test=003" -o /dev/null
curl -s -D - "http://localhost:6081/path/to/resource.jpg?test=004" -o /dev/null
curl -s -D - "http://localhost:6081/path/to/resource.jpg?test=005" -o /dev/null
curl -s -D - "http://localhost:6081/path/to/resource.jpg?test=006" -o /dev/null

Ban just 4-6:
curl -sS -X BAN -H 'x-ban: .*00[4-6].*' "http://localhost:6081/path/to/resource.jpg"
