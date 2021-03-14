// This is a workaround for an Unpoly issue on macOS (Safari and Firefox)
// On Mac OS (by design) buttons will not get focus when clicked
// so Unpoly fails to detect which button was clicked, and hence will
// not serialize it for the XHTML request.

up.compiler('form[up-target] button[type="submit"], form[up-target] input[type="submit"]', (element) => {
  element.addEventListener('click', () => {
    element.focus();
  });
});
