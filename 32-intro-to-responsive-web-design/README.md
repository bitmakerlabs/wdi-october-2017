# Responsive Web Design

Responsive Web Design is the term that refers to the principles and techniques
that allow you to make your site adapt to different screen sizes, from mobile to
tablet to desktop.


## Agenda
1. [Devices Galore!](#devices-galore)
2. [It's all about context](#it-s-all-about-context)
3. [Media queries](#media-queries)
4. [Meta Viewport](#meta-viewport)
5. [Responsive design is HARD](#responsive-design-is-hard)


## Devices Galore!
- Devices of all different sizes makes responsive design incredibly useful
- Instead of creating new sites or custom views specific for mobile
- Use CSS to adjust the layout of the site to accommodate different devices


## Meta viewport
- A `<meta>` tag that tells the browser your site is mobile-ready
- Changes the behaviour of your site on mobile devices that support it
- Full information can be found here in the Resources below


## Media queries
- Allow you to specify styles for devices with specific features
- Usually done on device-width, but [there are many others](https://developer.mozilla.org/en-US/docs/Web/Guide/CSS/Media_queries#Media_features)
- This allows your design to respond to the user's needs no matter the context


## It's all about context
- target ÷ context = result
- How do we determine the context?
- What units do we want to use here?


## Responsive design is HARD
- Grids
  - What techniques can we use to adapt our grids to different devices?
  - This is called a fluid grid system, which we'll look at next time
- Images
  - How do we scale images up and down depending on the screen size?
  - This seems like it could be tricky, but there's a very simple solution
  - img { max-width: 100%; }
- Media embeds
  - How do videos and other widgets scale on other devices?
  - This is a bit trickier and often requires JavaScript to work
- Tables
  - Tables are among the trickiest elements to make responsive
  - Often you'll have to get creative and hide columns, rows or just redesign
  without the table for smaller devices
