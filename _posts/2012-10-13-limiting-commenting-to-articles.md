---
layout: post
title: "Limiting comments to pages by using a regex"
description: "When enabling disqus on Nesta, here is a nice way to target pages to render the disqus code by using regex"
tags: [nesta]
image:
  feature: 9617788379_75ab730213_o.jpg
  credit: Aaron Addleman
comments: true
share: true
---

After I added the changes for enabling comments on my Nesta based website, I noticed they showed up everywhere and I decided to try and change this behavior. By adding the following code in my template called "comments.haml" I was able to target only the article pages:

{% highlight ruby %}
- if short_name = Nesta::Config.disqus_short_name
  - if @page.path =~ /^articles\/.*/
    #disqus_thread
      - if Sinatra::Application.environment == :development
        :javascript
          var disqus_developer = true;
      %script{:type => 'text/javascript', :src => "http://#{short_name}.disqus.com/embed.js", :async => true}

      %noscript
        %a(href="http://#{short_name}.disqus.com/embed.js?url=ref") View comments.
{% endhighlight %}