---
layout: processing
title: "Mandals grid"
description: "Generated mandals in a grid orientation"
tags: [processing]
image:
  feature: 11786474283_9f0f30e96c_o.jpg
  credit: Aaron Addleman
comments: true
share: true
processing: |
  void setup() {
    size(600,600);
    background(255);
    
    //presets
    int rows = 4;
    int cols = 4;
    float outerRadius = width/cols;
    
    // randomly generated
    int pointCount;
    int steps;
    float innerRadius;
    float outerRadiusRatio;
    float innerRadiusRatio;
    float shadeRatio;
    float rotationRatio;
    
    translate(outerRadius/2, outerRadius/2);
    for (int i=0; i<rows; i++) {
      for (int j=0; j<cols; j++) {
        pointCount = int(random(5,15));
        steps = int(random(3,20));
        innerRadius = outerRadius/steps;
        outerRadiusRatio = outerRadius/steps;
        innerRadiusRatio = innerRadius/steps;
        float randCol = random(255, 255);
        shadeRatio = randCol/steps;
        rotationRatio = random(90, 200)/steps;
        pushMatrix();
        translate(outerRadius*j, outerRadius*i);
        for (int k=0; k<steps; k++) {
          fill(shadeRatio*k);
          stroke(randCol-shadeRatio*k, 100);
          pushMatrix();
          scale(.4);
          rotate(rotationRatio*k*PI/180);
          star(pointCount, outerRadius-outerRadiusRatio*k, innerRadius-innerRadiusRatio*k);
          popMatrix();
        }
        popMatrix();
      }
    }
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
  } // end star
---

## Mandalas grid

This was in my book of learning processing and made for a great exercise in experimenting with permutations of generating variations of geometry.

<script type="application/processing" data-processing-target="pjs">
{{ page.processing }}
</script>

<canvas id="pjs"> </canvas>

## Source code

{% highlight java %}
{{ page.processing}}
{% endhighlight %}