import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = {url: String}
  connect() {
    console.log("hello")
    console.log(this.urlValue)
  }
  next() {
    // console.log(this.completeTarget)
    fetch(this.urlValue, {
      method: "POST", // Could be dynamic with Stimulus values
      headers: { "Accept": "text/html" },
      // body: JSON.stringify({})
    })
    .then(response => response.text())
    .then((data) => {
      console.log(data)
    })
  }


}
