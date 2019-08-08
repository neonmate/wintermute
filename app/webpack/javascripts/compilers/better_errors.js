// https://makandracards.com/makandra/79164-unpoly-automatically-show-the-full-better_errors-page-when-rails-raises-an-error
document.addEventListener('DOMContentLoaded', function () {
  if (document.body.dataset.env == 'development') {
    // Returns true when your development server shows an error page.
    function isDevelopmentError(response) {
      return response.isError() && /Full backtrace|Better errors/.test(response.text)
    }


    // When the development server shows an error page, repeat the request as a full page load.
    up.on('up:proxy:loaded', function(event) {
      if (isDevelopmentError(event.response)) {
        event.request.navigate()
      }
    })
  }
})
