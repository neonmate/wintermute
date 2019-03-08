const DEFAULT_TARGET = '.content'

up.macro('form:not([up-target])', function(form) {
  form.setAttribute('up-target', DEFAULT_TARGET)
})
