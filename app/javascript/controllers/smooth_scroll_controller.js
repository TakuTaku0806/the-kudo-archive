// app/javascript/controllers/smooth_scroll_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    console.log("✅ Smooth Scroll Connected!", this.element)
    this.element.addEventListener('click', this.handleClick)
  }

  disconnect() {
    this.element.removeEventListener('click', this.handleClick)
  }

  handleClick = (event) => {
    // 1. Check if a link was clicked
    const link = event.target.closest('a')
    if (!link) return

    // 2. Check if it's an anchor link (starts with #)
    const href = link.getAttribute('href')
    if (!href || !href.startsWith('#') || href === '#') return

    // 3. Find the target element
    const targetId = href.substring(1)
    const target = document.getElementById(targetId)

    if (target) {
      event.preventDefault()
      target.scrollIntoView({ behavior: 'smooth', block: 'start' })
      history.pushState(null, null, href)
    } else {
      console.warn("❌ Target not found for ID:", targetId)
    }
  }
}