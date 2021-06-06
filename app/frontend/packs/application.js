import Rails from "@rails/ujs"
// import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
// import "channels"


import '../styles/application'
import 'bootstrap/dist/js/bootstrap'
import 'lightbox2/dist/js/lightbox'
import '../scripts/ys_map'
import "@fortawesome/fontawesome-free/css/all"

import lightbox from 'lightbox2/dist/js/lightbox'

lightbox.option({
    'resizeDuration': 200,
    'wrapAround': true,
    'albumLabel': "Изображение %1 из %2"
})

const images = require.context('../images', true)

Rails.start()
// ActiveStorage.start()
