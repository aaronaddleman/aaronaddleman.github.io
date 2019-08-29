---
title: Howtos
layout: page
icon: collections
description: |
  Howtos collection of things I have used.
---

{% for howto in site.howtos %}
  {{ howto.content }}
{% endfor %}
