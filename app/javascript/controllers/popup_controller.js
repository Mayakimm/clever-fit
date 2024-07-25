import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static targets = ["menu"];

  connect() {
    document.addEventListener('click', this.handleClickOutside.bind(this));
    document.getElementById('log-off-link')?.addEventListener('click', this.logOff.bind(this));
  }

  disconnect() {
    document.removeEventListener('click', this.handleClickOutside.bind(this));
    document.getElementById('log-off-link')?.removeEventListener('click', this.logOff.bind(this));
  }

  toggleMenu(event) {
    event.stopPropagation();
    this.menuTarget.classList.toggle('hidden');
  }

  handleClickOutside(event) {
    if (this.menuTarget && !this.menuTarget.contains(event.target) && !event.target.matches('.fa-solid fa-bars')) {
      this.menuTarget.classList.add('hidden');
    }
  }

  navigateTo(event) {
    event.preventDefault();
    const url = event.target.getAttribute('href');
    window.location.href = url;
  }

  logOff(event) {
    event.preventDefault();
    fetch('/logout', {
      method: 'DELETE',
      credentials: 'same-origin',
      headers: {
        'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').getAttribute('content')
      }
    })
    .then(response => {
      if (response.ok) {
        window.location.href = '/';
      }
    });
  }
}
