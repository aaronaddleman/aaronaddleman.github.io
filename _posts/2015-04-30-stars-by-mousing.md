---
layout: processing
title: "Stars by mousing"
description: "Stars by mousing"
tags: [processing]
image:
  feature: DSC03138_s.jpeg
  credit: Aaron Addleman
comments: true
share: true
processing: |
  void setup() {
    size(400,400,P3D);
    noSmooth();
  }

  void draw() {
    pushMatrix();
    translate(width/2,height/2);
    
    pushMatrix();
    rotate(mouseX/20/PI);
    star(6,40,60);
    translate(width/4,height/4);
    star(12,30+mouseX,mouseY/2);
    popMatrix();
    popMatrix();
  }
  void star(int pointCount, float innerRadius, float outerRadius) {
    float theta = 0.0;
    // point count is 1/2 of total vertex count
    int vertCount = pointCount*2;
    float thetaRot = TWO_PI/vertCount;
    float tempRadius = 0.0;
    float x = 0.0, y = 0.0;
    
    beginShape();
    for (int i=0; i<pointCount; i++) {
      for (int j=0; j<2; j++) {
        tempRadius = innerRadius;
        
        // true if j is even
        if (j%2==0) {
          tempRadius = outerRadius;
        }
        
        x = cos(theta)*tempRadius;
        y = sin(theta)*tempRadius;
        vertex(x, y);
        theta += thetaRot;
      }
    }
    endShape(CLOSE);
  } //end star

---

## Stars by mousing

While having some fun with Processing, I started to experiment with pushMatrix(),  popMatrix(), and translate(). This was a fun experiment to play with as I found the interesting benefits you get when passing mouseX and mouseY to isolated functions. I hope to try and slow down the rendering of the shapes some day.

<script type="application/processing" data-processing-target="pjs">
{{ page.processing }}
</script>

<canvas id="pjs"> </canvas>

## Source code

{% highlight java %}
{{ page.processing}}
{% endhighlight %}