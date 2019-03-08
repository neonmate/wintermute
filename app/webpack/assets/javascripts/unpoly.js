document.addEventListener('DOMContentLoaded', function() {
  if (document.body.getAttribute('environment') === 'test') {
    // Disable animations in tests
    up.motion.config.enabled = false

    // When revealing elements, don't animate the scrolling
    up.viewport.config.duration = 0
  }
}, false)
