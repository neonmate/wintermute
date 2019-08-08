up.compiler('[data-collapsable-navigation]', function(element, data) {
  let target = document.getElementById(data["target"])

  up.on(element, 'click', function() {
    up.element.toggleClass(target, 'collapse')
  })

  up.on(target, 'click', function() {
    if (!target.classList.contains('collapse')) {
      up.element.toggleClass(target, 'collapse')
    }
  })
})
