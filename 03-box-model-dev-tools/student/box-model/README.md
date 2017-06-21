# The CSS Box Model

All elements in our HTML page are rendered as a rectangle (or square), even circles, as you will soon see. Let's explore how we can affect elements and our page's layout by setting parameters for a box.

## Content
Let's change the shape of our box.

1. Set the `width` of our .box to 300px
2. Set the `height` of our .box to 300px

Width and height refer to the shape of the **content** of our box. Note the default value of `auto` for width/height, behaves differently for each property respectively.

## Padding
Our box's content is rather close to the edges of the .box. Let's give ourselves a bit more breathing room.

3. Set the `padding` of our .box to 15px

Note the **physical** size of our box has changed. Imagine scenarios where this might be problematic. Also notice the area around the .box that's been added takes the same colour of the background of the .box

## Border

This box looks great, but we need to give our .box something around the edge.

4. Set a `border-width`, `border-style`, `border-color` to `3px solid #000000` respectively.
5. Combine these properties together as a single `border`
6. Change the border's style to one of dashed, dotted or double.
7. Give the box a border-radius of 5px
8. Try changing the border-radius to 50%

Notice once again that the **physical** size of our box has changed.

## Box sizing

9. Set the `box-sizing` to border-box
10. Set this property to all elements going forward with the `*` selector

Note the physical size of our box is now dictated by our content properties (width/height)

## Margin

11. Set the margin of our .box to 20px

Note the box moves out of it's physical place in the layout. Using our developer tools, notice that the box takes a margin all the way around. Nothing else can get into that space. Also notice something strange is happening to the right of the box.

## Expanding padding, border-width, margin

Each of `padding`, `border-width` and `margin` can be set for each of the box's sides individually: top, right, bottom, left

12. Set `padding-top`, `padding-right`, `padding-bottom`, `padding-left` to different sizes
13. Set `border-top-width`, `border-right-width`, `border-bottom-width`, `border-left-width` to different sizes
14. Set `margin-top`, `margin-right`, `margin-bottom`, `margin-left` to different sizes
15. Abbreviate the original `padding`, `border-width`, `margin` with 2, 3, and 4 numbers

## Horizontal centering

Remember the extra margin that ended up at the right of our box?

16. Set the `margin-left` and `margin-right` to auto

This works to center all `display:block` elements within their container

## Maximum width

We can also now consider our .box the first building block of our layout.

18. Set the width of our element to a %
17. Set the `max-width` of of our element to 800px

Notice we now have a layout that has responsive properties

## Overflow

In general, we don't ever want to restrict the height of our content such that we may have content that spills outside of it's boundaries.

19. Add some `lorem` ipsum to our box to ensure the content goes beyond the height of our box
20. Set the `overflow` of our box to hidden
21. Set the `overflow` of our box to scroll
