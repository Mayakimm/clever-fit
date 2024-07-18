import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["watch", "content"]
  // connect() {
  //   console.log(this.element)
  // }

  toggle(event) {
    event.preventDefault()
    console.log(this.contentTarget);
    this.contentTarget.classList.toggle("d-none");
  }
}
