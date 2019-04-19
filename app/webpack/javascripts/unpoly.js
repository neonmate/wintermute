document.addEventListener('DOMContentLoaded', function() {
  up.viewport.config.fixedTop.push('.fixed-top')

  if (document.body.getAttribute('environment') === 'test') {
    // Disable animations in tests
    up.motion.config.enabled = false

    // When revealing elements, don't animate the scrolling
    up.viewport.config.duration = 0
  }
}, false)
