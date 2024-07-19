import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
    static targets = [ "box"];
    connect() {
        console.log("Lightbox controller connected!");
    }

    open(event) {
        event.preventDefault();
        console.log("Opening lightbox...");
        this.boxTarget.classList.add('open');
    }

    close(event) {
        event.preventDefault();
        console.log("Closing lightbox...");
        this.boxTarget.classList.remove('open');
    }
}
