const DEFAULT_TARGET = '.modal-target'

up.macro('[modal-link]', function(link) {
  let target = link.getAttribute('modal-link') || DEFAULT_TARGET
  let attrs = {
    'up-modal': target,
    'up-preload': '',
    'up-instant': '',
  }

  // It feels wrong for a button
  if (link.matches('.btn:not(.btn-link)')) {
    delete attrs['up-instant']
  }

  for (let [key, value] of Object.entries(attrs)) {
    link.setAttribute(key, value)
  }
})
