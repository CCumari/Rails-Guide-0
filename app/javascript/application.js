// Configure your import map in config/importmap.rb

import "@hotwired/turbo-rails"
import { Application } from "@hotwired/stimulus"
import "@hotwired/stimulus-loading"

// Import Trix and Action Text for rich text editor
import "trix"
import "@rails/actiontext"

// Load all Stimulus controllers
const application = Application.start()
window.Stimulus = application

export { application }
