import { Controller } from "stimulus";

export default class extends Controller {
    static targets = ["lightbox"];

    connect() {
        console.log("Lightbox controller connected!");
    }

    open(event) {
        event.preventDefault();
        console.log("Opening lightbox...");
        this.lightboxTarget.classList.add('open');
    }

    close(event) {
        event.preventDefault();
        console.log("Closing lightbox...");
        this.lightboxTarget.classList.remove('open');
    }
}
