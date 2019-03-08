const DEFAULT_TARGET = '.page-target'

up.macro('[content-link]', (link) => {
  let target = link.getAttribute('content-link') || DEFAULT_TARGET
  let attrs = {
    'up-target': target,
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
