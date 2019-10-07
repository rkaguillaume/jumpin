import Rails from 'rails-ujs';

function initMap() {
  const showMapBtn = document.getElementById('map-wrapper');

  if (showMapBtn) {
      navigator.geolocation.getCurrentPosition(function(data) {
        Rails.ajax({
          type: "GET",
          url: "/maps?lat=" + data.coords.latitude + "&lng=" + data.coords.longitude,

        })
      });

  }
}

export { initMap };
