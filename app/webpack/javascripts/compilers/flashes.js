up.compiler('.alert ', function(element) {
  let button = element.getElementsByClassName('close')[0];

  button.addEventListener('click', function(event) {
    element.remove()
  })
})
