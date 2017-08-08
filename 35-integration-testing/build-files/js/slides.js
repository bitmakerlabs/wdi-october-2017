document.addEventListener('DOMContentLoaded', function() {

  var slideshow = remark.create(
    {
      countIncrementalSlides: false,
      highlightLanguage: 'css',
      // highlightStyle: 'solarized-light',
      highlightStyle: 'atelier-cave-light',
      highlightSpans: true,
      highlightBlockSpans: true,
      highlightLines: true,
      navigation: { scroll: false }
    }
  )

  slideshow.on('showSlide', function (slide) {
    console.log(slide)
  })

  highlight_inline_code()

})

function highlight_inline_code() {
  const remark_inline_code_els = document.querySelectorAll('.remark-inline-code');
  [].forEach.call(remark_inline_code_els, function(el) { hljs.highlightBlock(el) })
}
