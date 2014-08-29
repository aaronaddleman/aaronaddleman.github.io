---
layout: post
title: "Using Ruby to check redirects"
description: "When you have many redirects to test, automate it with ruby and typhoeus."
tags: [ruby]
image:
  feature: 8160155219_edf33c3485_o.jpg
  credit: Aaron Addleman
comments: true
share: true
---

# Using Ruby to check redirects

While writing the script, I first stared out with net/http. This was going pretty slow and when I had 1900+ urls to verify, I calculated it would take approximately 2 hours to complete. While that was acceptable I found out that a lot of links were broken which translated into running this script more than 10 times to re-verify. So I did some searching around and found the gem "typhoeus". Very cool gem indeed. This made things go much faster. I included both snippets of code in my script to show progression and for note gathering.

Here is my code:

{% highlight ruby %}
require 'uri'
require 'net/http'
require 'csv'
require 'typhoeus'

# =====================================================================
# = Check_Redirection.rb =
# 
# Verify urls for redirection by comparing the old url to the new url
#
#
# CSV format:
# old_url,new_url
# 
# Expected output:
# status,old_url,new_url
# =====================================================================


# =======================================
# = The new way with typhoeus and hydra =
# =======================================
hydra = Typhoeus::Hydra.new(:max_concurrency => 5)

CSV.open("redirects.csv").each do |row|
  # by using followlocation, we can use the response_code to validate the redirect
  request = Typhoeus::Request.new(row[0], followlocation: true)
  
  request.on_complete do |response|
    if response.response_code == 200
      puts "Working,#{row[0]},#{row[1]}"
    else
      puts "Broken,#{row[0]},#{row[1]}"
    end
  end  
  hydra.queue(request)
end

hydra.run


# ==========================
# = The test with typhoeus =
# ==========================
results = Typhoeus::Request.get("http://google.com")
puts results.response_code

if results.effective_url == "http://google.com"
  puts "GOOD - should be #{results.effective_url}"
else
  puts "BAD - should be #{results.effective_url}"
end


# =============================
# = The old way with net/http =
# =============================
def fetch(uri_str, limit = 10)
  # You should choose a better exception.
  raise ArgumentError, 'too many HTTP redirects' if limit == 0
  response = Net::HTTP.get_response(URI(uri_str))
  case response
  when Net::HTTPSuccess then
    response
  when Net::HTTPRedirection then
    location = response['location']
    # print redirect
    redirected_to = location
    fetch(location, limit - 1)
    return redirected_to
  else
    response.value
  end
end

# test one url
print fetch('http://www.ruby-lang.org')

# test urls from csv file
CSV.open("redirects.csv").each do |row|
  begin
    fetching = "#{row[0]},#{row[1]}"
    redirected_to = fetch(row[0])
    # if redirected_to == row[1]
    #   puts "Working,#{fetching}"
    # end
  rescue Net::HTTPServerException
    puts "Broken,#{fetching}"
  end
end
{% endhighlight %}
