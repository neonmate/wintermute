up.macro('.modal-target', (modalTarget) => {
  // We want to distinguish whether the current element is the modal-target of the main page or
  // the modal-target within an opened modal. This is necessary as up.modal.isOpen() will return true
  // even if it is closing a few steps later.
  if (!modalTarget.parentElement.classList.contains('up-modal-content')) return

  let modalContent = modalTarget.parentElement
  let card = modalTarget.getElementsByClassName('card')[0]

  if (up.util.isPresent(card)) {
    let cardHeader = card.getElementsByClassName('card-header')[0]
    let cardBody = card.getElementsByClassName('card-body')[0]
    let cardFooter = card.getElementsByClassName('card-footer')[0]

    if (up.util.isPresent(cardHeader)) {
      cardHeader.classList.replace('card-header', 'modal-header')
      let closeButton = up.element.createFromHtml(`
        <button type="button" class="close" up-close aria-label="Close">
          <span aria-hidden="true">×</span>
        </button>
      `)
      cardHeader.append(closeButton)
    }

    if (up.util.isPresent(cardBody)) {
      cardBody.classList.replace('card-body', 'modal-body')
    }

    if (up.util.isPresent(cardFooter)) {
      cardFooter.classList.replace('card-footer', 'modal-footer')
    }

    card.classList.remove('card')
    modalContent.style.padding = '0px'
  }
})
