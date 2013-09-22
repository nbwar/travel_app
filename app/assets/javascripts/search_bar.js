function SearchBox(searchBox) {
  this.searchBox = searchBox;
  google.maps.event.addDomListener(window, 'load', this.searchAutoComplete());
}

SearchBox.prototype.searchAutoComplete = function() {
  var autocomplete = new google.maps.places.Autocomplete(this.searchBox);
};
