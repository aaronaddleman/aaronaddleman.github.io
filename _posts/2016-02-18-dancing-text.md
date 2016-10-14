---
layout: processing2
title: "Dancing Text"
description: "Dancing text while messing around with Processing"
tags: [processing]
image:
  feature: https://c3.staticflickr.com/8/7706/16440623354_d46251d831_z.jpg
  credit: Aaron Addleman
comments: true
share: true
processing: |

  String words = "john and the volta";

  void setup() {
    size(400, 400, OPENGL);
    PFont fontA = loadFont("Courier New");
    textFont(fontA, 8);
    fill(255);
  }

  void draw() {
    background(0);
    pushMatrix();
    translate(-200, -50, -450);
    rotateY(0.3);
    int words_length = 1;

    // for each line in the array of words, increment i
    for (int i = 0; i < words.length(); i++) {
      float f1 = sin((i + 10.0) * (millis() / 10000.0) * TWO_PI);
      float f2 = sin((18.0 - i) * (millis() / 10000.0) * TWO_PI);
      String line = words;
      pushMatrix();
      translate(0.0, i*75, 0.0);
      for (int j = 0; j < 10; j++) {
        if (j != 0) {
          translate(10 * 75, 0.0, 0.0);
        }
        rotateX(sin((i + 10.0) * (millis() / 1000000.0 * j) * TWO_PI));
        rotateY(sin((i + 20.0) * (millis() / 1000000.0 * j) * TWO_PI));
        pushMatrix();
        scale(7.0);
        text(words, 0.0, 0.0);
        popMatrix();
      }
      popMatrix();
    }
    popMatrix();
  }    

---

Another program I came up with in Processing a while ago. 

<script type="application/processing" data-processing-target="pjs">
{{ page.processing }}
</script>

<canvas id="pjs"> </canvas>

## Source code

{% highlight java %}
{{ page.processing}}
{% endhighlight %}