import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="preview"
export default class extends Controller {
  static targets=["photoInput", "photoPreview"]
  connect() {
  }

  displayPreview() {
    if (this.photoInputTarget.files && this.photoInputTarget.files[0]) {
      const reader = new FileReader();
      reader.onload = (event) => {
        this.photoPreviewTarget.src = event.currentTarget.result;
      }
      reader.readAsDataURL(this.photoInputTarget.files[0])
      this.photoPreviewTarget.classList.remove('hidden');
    }
  }
}
