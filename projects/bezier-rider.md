---
layout: project
title: Bezier Rider
date: March—April 2015
image: "images/bezier-login.png"
---

**Project Link:** [https://github.com/justinvyu/bezierrider](https://github.com/justinvyu/bezierrider)

#### Technologies Used
Objective C, SpriteKit

#### Screenshots

<div class="container" style="margin: 2rem 0;">
  <div class="row">
    <div class="col-sm-6">
    <div class="card">
        <img src="{{site.baseurl}}/projects/images/bezier-login.png" class="card-img-top" alt="...">
        <div class="card-body">
        <h5 class="card-title">Home Screen 🏡</h5>
        <p class="card-text">The Bezier curve here is drawn using a UIBezierPath!</p>
        </div>
    </div>
    </div>
    <div class="col-sm-6">
    <div class="card">
        <img src="{{site.baseurl}}/projects/images/bezier-playground.png" class="card-img-top" alt="...">
        <div class="card-body">
        <h5 class="card-title">Playground 🏀</h5>
        <p class="card-text">
            Plot a Bezier curve by tapping 3 or 4 points on the screen. 3 points will create a quadratic
            Bezier curve, and 4 points will create a cubic curve.
        </p>
        </div>
    </div>
    </div>
  </div>
  <div class="row">
    <div class="col-sm-6">
    <div class="card">
        <img src="{{site.baseurl}}/projects/images/bezier-level.png" class="card-img-top" alt="...">
        <div class="card-body">
        <h5 class="card-title">Reach the Goal! 🏁</h5>
        <p class="card-text">
            After plotting the points, click play to turn those bezier curves into platforms for the
            ball to roll on... to the goal!
        </p>
        </div>
    </div>
    </div>
    <div class="col-sm-6">
    <div class="card">
        <img src="{{site.baseurl}}/projects/images/bezier-gameplay.png" class="card-img-top" alt="...">
        <div class="card-body">
        <h5 class="card-title">Challenging Levels 🤯</h5>
        <p class="card-text">
            Turn on gravity and watch the platforms appear! Look out for moving platforms to time your
            run.
        </p>
        </div>
    </div>
    </div>
  </div>
</div>

#### Summary

This is a game I created for my final project in math class in 9th grade!

The topic I chose to study was [`Bezier Curves`](https://en.wikipedia.org/wiki/B%C3%A9zier_curve), which are 
interpolated curves used in lots of applications, primarily computer graphics. The main idea behind generating
Bezier curves is producing a (weighted) linear combination a set of basis functions. Four points will uniquely
define a family of cubic Bezier curves, but not because the curve will go *through* these four points, but because
the linear combination weightings for each point can be changed in such a way to produce a bunch of possible curves,
bounded by these four points. Take a look at this article if you want to learn more: [https://pomax.github.io/bezierinfo/](https://pomax.github.io/bezierinfo/).

As for the game itself, I thought a little interactivity would spice up my final presentation. I modeled it after 
"line rider" type of games like [this one](https://www.linerider.com/), but instead of just drawing a line with
your hand, you plot points to create Bezier curves! The curves do not appear as you plot the points, but rather
when the `Play` button is pressed. At that point, all curves become platforms, and gravity starts affecting the
red ball. If the red ball leaves the bounds of the screen, then the scene resets and you can try again.
The goal is to reach the black target at the other side of the screen using as few curves as possible.