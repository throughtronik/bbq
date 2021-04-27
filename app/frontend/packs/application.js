import Rails from "@rails/ujs"
// import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
// import "channels"

import '../styles/application'
import 'bootstrap/dist/js/bootstrap'

const images = require.context('../images', true)

Rails.start()
// ActiveStorage.start()
