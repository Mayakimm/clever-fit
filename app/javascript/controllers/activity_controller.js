import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = [ "type" ];
  connect() {
    console.log("activity controller connected!");
    console.log(this.element);
    console.log(this.typeTarget);
  }

  open(event) {
    event.preventDefault();
    console.log("oepn connected")
    this.typeTarget.classList.add('open');
  }

  close(event) {
    event.preventDefault();
    this.typeTarget.classList.remove('open');
  }
}
