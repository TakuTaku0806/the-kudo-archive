import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["input"]

  apply(event) {
    const tag = event.currentTarget.dataset.tag
    const textArea = this.inputTarget
    const start = textArea.selectionStart
    const end = textArea.selectionEnd
    const selectedText = textArea.value.substring(start, end)

    let replacement = ""

    switch (tag) {
      case "ul":
        replacement = `<ul>\n  <li>${selectedText || 'List item'}</li>\n</ul>`
        break
      case "ol":
        replacement = `<ol>\n  <li>${selectedText || 'List item'}</li>\n</ol>`
        break
      case "center":
        replacement = `<div class="text-center">${selectedText || 'Centered Text'}</div>`
        break
      case "blockquote":
        replacement = `<blockquote>${selectedText || 'Quote Text'}</blockquote>`
        break
      default:
        replacement = `<${tag}>${selectedText}</${tag}>`
    }

    textArea.setRangeText(replacement, start, end, 'select')
    textArea.focus()
  }
}