import { Controller } from "@hotwired/stimulus"
import TomSelect from "tom-select";

// Connects to data-controller="tom-select"
export default class extends Controller {
  static values = { options: Object }

  connect() {
    console.log('connected');
    new TomSelect(
      this.element,
      {
        sortField: 'text'
      }
    );
  }
}
