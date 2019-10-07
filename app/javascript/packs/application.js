import "popper.js";
import "bootstrap";
import 'mapbox-gl/dist/mapbox-gl.css';

import Rails from 'rails-ujs';
Rails.start();
window.Rails = Rails;

import { initCountdown } from '../plugins/init_countdown'
import { flyout } from '../plugins/flyout'
import { initMap } from '../plugins/init_map';
import { initMapbox } from '../plugins/init_mapbox';
import { searchStop } from '../plugins/search_stop';
import { initFullscreen } from '../plugins/init_fullscreen';
import { initNotification } from '../plugins/init_notification';

flyout();
initCountdown();
initMap();
initFullscreen();
initMapbox();

window.initMapbox = initMapbox;
window.searchStop = searchStop;

if (navigator.serviceWorker) {
  navigator.serviceWorker.register('/service-worker.js', { scope: './' })
    .then(function(reg) {
      console.log('[Companion]', 'Service worker registered!');
      console.log(reg);
    });
}
