---
layout: processing
title: "Random quadrangles"
description: "Generating random quagrangles"
tags: [processing]
image:
  feature: IMG_0566.JPG
  credit: Aaron Addleman
comments: true
share: true
processing: |
  // rectangle_plot
  void setup(){
    size(600,600);
    background(255);
    for (int i = 0;i < 10; i = i+1) {
      plotRandomizedQuad(
               200, 
               200, 
               200, 
               200,
               .8,
               .2);
    }
  } // end setup

  void plotRandomizedQuad(
    float x, 
    float y, 
    float w, 
    float h,
    float randW,
    float randH) 
  {
    float jitterW = w*randW;
    float jitterH = h*randH;
    beginShape();
    fill(random(0, 255), 100, random(0, 255));
    vertex(x+random(-jitterW, jitterW), y+random(-jitterH, jitterH));
    vertex(x+random(-jitterW, jitterW), y+h+random(-jitterH, jitterH));
    vertex(x+w+random(-jitterW, jitterW), y+h+random(-jitterH, jitterH));
    vertex(x+w+random(-jitterW, jitterW), y+random(-jitterH, jitterH));
    endShape(CLOSE);
  }

---

## Random quadrangles

Upon loading this page the processing sketch should generate 10 quadrangles with some randomization of width, height, and color.


<script type="application/processing" data-processing-target="pjs">
{{ page.processing }}
</script>

<canvas id="pjs"> </canvas>

## Source code

{% highlight java %}
{{ page.processing}}
{% endhighlight %}