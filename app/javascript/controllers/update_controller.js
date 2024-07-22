import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["timer", "caloriesBurnt"]

  connect() {
    this.startTime = new Date(this.data.get("startTime"))
    this.caloriesBurntPerSecond = parseFloat(this.data.get("caloriesBurntPerSecond"))
    this.totalCaloriesBurnt = parseFloat(this.data.get("totalCaloriesBurnt"))

    this.update()
    this.interval = setInterval(() => {
      this.update()
    }, 500)
  }

  disconnect() {
    clearInterval(this.interval)
  }

  update() {
    this.updateTime()
    this.updateCalories()
  }

  updateTime() {
    const now = new Date()
    const diff = new Date(now - this.startTime)
    const hours = String(diff.getUTCHours()).padStart(2, '0')
    const minutes = String(diff.getUTCMinutes()).padStart(2, '0')
    const seconds = String(diff.getUTCSeconds()).padStart(2, '0')
    this.timerTarget.textContent = `${hours}:${minutes}:${seconds}`
  }

  updateCalories() {
    const now = new Date()
    const diffInSeconds = Math.floor((now - this.startTime) / 1000)
    const caloriesBurnt = (this.caloriesBurntPerSecond * diffInSeconds + this.totalCaloriesBurnt).toFixed(2)
    this.caloriesBurntTarget.textContent = caloriesBurnt
  }
}
