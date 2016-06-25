function refreshPartial() {
  $.ajax({
    url: "users/refresh_spotify_table"
 });
 console.log('Hello');
}

$(document).ready(function () {
    // will call refreshPartial every 3 seconds
    setInterval(refreshPartial, 3000);
});