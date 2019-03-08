import autosize from 'autosize'

up.compiler('[textarea]', function(element) {

  autosize(element)

  return function() {
    autosize.destroy(element)
  };

})
