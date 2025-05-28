import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["column"]

  connect() {
    this.draggedElement = null

    this.columnTargets.forEach((column) => {
      column.addEventListener("dragover", this.handleDragOver.bind(this))
      column.addEventListener("drop", this.handleDrop.bind(this))
    })

    this.element.querySelectorAll(".draggable").forEach((card) => {
      card.addEventListener("dragstart", this.handleDragStart.bind(this))
      card.addEventListener("dragend", this.handleDragEnd.bind(this))
    })
  }

  handleDragStart(event) {
    this.draggedElement = event.target
    event.dataTransfer.effectAllowed = "move"
    event.dataTransfer.setData("text/plain", event.target.dataset.issueId)
    event.target.classList.add("dragging")
  }

  handleDragEnd(event) {
    event.target.classList.remove("dragging")
    this.draggedElement = null
  }

  handleDragOver(event) {
    event.preventDefault()
    event.dataTransfer.dropEffect = "move"
  }

  handleDrop(event) {
    event.preventDefault()
    const issueId = event.dataTransfer.getData("text/plain")
    const newStatus = event.currentTarget.dataset.status
    const draggedCard = this.element.querySelector(`[data-issue-id='${issueId}']`)

    if (!draggedCard) return

    // Append dragged card to new column
    event.currentTarget.appendChild(draggedCard)

    fetch(`/issues/${issueId}/update_status`, {
      method: "PATCH",
      headers: {
        "Content-Type": "application/json",
        "Accept": "text/vnd.turbo-stream.html",
        "X-CSRF-Token": document.querySelector("[name='csrf-token']").content
      },
      body: JSON.stringify({ status: newStatus })
    })
  }
}
