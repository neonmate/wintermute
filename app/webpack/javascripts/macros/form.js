const DEFAULT_TARGET = '.page-target'

up.macro('form:not([up-target])', function(form) {
  form.setAttribute('up-target', DEFAULT_TARGET)
})
