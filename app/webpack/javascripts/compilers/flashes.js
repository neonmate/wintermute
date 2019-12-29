up.compiler('.alert ', function(element) {
  let button = element.getElementsByClassName('close')[0];

  if (up.util.isPresent(button)) {
    button.addEventListener('click', function(event) {
      element.remove()
    })
  }
})
