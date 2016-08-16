# CSS Transitions and Animations

With the building blocks of CSS and JavaScript, the missing piece to your UI, the "wow-factor", is subtle transitions and animations that delight users and provide affordances that allow them to understand what's happening in your app.

## Agenda
After this lesson, you'll know:

  1. [Transitions vs. Animations](#transitions-vs-animations)
  2. [Why not just use Javascript?](#why-not-just-use-javascript)
  3. [What can (and can't) be animated?](#what-can-and-can-t-be-animated)
  4. [Basic Transitioning](#basic-transitioning)
  5. [Controlling animations via Javascript](#controlling-animations-via-javascript)
  6. [Performant animations](#performant-animations)


## Transitions vs Animations
- Transitions animate one or more properties from a start to an end point
- Animations can specify CSS rules at different points along the animation
- Animations need to be defined using the `@keyframe` directive


## Why not just use Javascript?
- Most importantly, using CSS Transitions and Animations are much simpler to implement
- Javascript in the browser is single-threaded
- While you can do animations with Javascript, they could block other stuff from happening
- CSS Transitions and Animations are offloaded to the GPU
- The GPU was made to do this type of work and frees up the browser
- That being said, done correctly, JS can actually outperform CSS animations and provide a lot more control over the animations as they progress
- Libraries like [VelocityJS](http://julian.com/research/velocity/) help bridge the gap


## What can (and can't) be animated?
- Can only animate items with numerical values


## Basic Transitioning
- Transition rules
- Setting transitions on properties


## Controlling animations via Javascript
- Toggling classes dynamically to initiate animations


## Performant animations
- Not all animations are created equal
- Triggering GPU animations
- Avoiding animations that require repaints


---

## CSS Animations

We focused on basic transitions in the last section. Now we'll step it up a
notch and learn to define more advanced transitions and introduce the
syntax and power of defining your own custom animations.


1. [Transitioning with transforms](#transitioning-with-transforms)
2. [Animations Redux](#animations-redux)
3. [Defining custom animations](#defining-custom-animations)
4. [Using custom animations](#using-custom-animations)
5. [The future of UIs on the Web](#the-future-of-uis-on-the-web)


## Transitioning with transforms
- CSS3 allows you to use 2D/3D transforms to manipulate DOM objects
- Transforms include translate, scale, rotate and opacity
- All of these transforms are offloaded to the GPU
- We can combine them to create complex transitions


## Animations Redux
- Animations can specify CSS rules at different points along the animation
- Animations need to be defined using the `@keyframe` directive


## Defining custom animations
- Setting @keyframes to precisely control animations


## Using custom animations
- Now that we have a named animation, we can use it on our DOM elements
- We use the same techniques we used for transitions, but now using our new named animation

## The Future of UIs on the Web
- [Famo.us](http://famo.us)
- WebGL
