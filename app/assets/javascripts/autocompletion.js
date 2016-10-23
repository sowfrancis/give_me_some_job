var placeSearch, autocomplete, autocompleteEl;
function initAutocompleteChallengeForm() {
  autocompleteEl = document.getElementById('autocomplete')
  if (!autocompleteEl) { return; }
  autocomplete = new google.maps.places.Autocomplete(
      /** @type {!HTMLInputElement} */(autocompleteEl),
      {types: []});
}