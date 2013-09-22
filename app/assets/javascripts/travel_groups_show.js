var groupView = {
  injectPartial: function(html) {
    $("#display_container").html(html);
  }
};

var groupListeners = {
  init: function() {
    this.suggestionsListener();
    this.bookListener();
    this.voteListener();
  },
  bookListener: function() {
    $("#book_listener").on("click", function(e) {
      e.preventDefault();
      groupController.bookings();
    });
  },
  suggestionsListener: function() {
    $("#vote_listener").on("click", function(e) {
      e.preventDefault();
      groupController.suggestions();
    });
  },
  voteListener: function() {
    $("body").on("click", 'a.vote_cast', function(e) {
      e.preventDefault();
      voteController.castVote($(this));
    });
  }
};

var groupController = {
  bookings: function() {
    var groupId = $('#group_id').data('group');
    data = {group: groupId};
    $.ajax({
      method: 'get',
      url: '/bookings',
      data: data
    }).done(function(response) {
      groupView.injectPartial(response)
    });
  },
  suggestions: function(){
    var groupId = $('#group_id').data('group');
    data = {group: groupId};
    $.ajax({
      method: 'get',
      url: '/suggestions',
      data: data
    }).done(function(response) {
      groupView.injectPartial(response)
    });
  }
};


var voteController = {
  castVote: function(linkEl) {
    var suggestionId = linkEl.data('suggestion');
    var choice = linkEl.data('choice');
    var data = {suggestion: suggestionId, choice: choice}
    $.ajax({
      method: "post",
      url: "/cast_vote",
      data: data
    }).done(function(response) {
      if(response.success === "true") {
        linkEl.closest('li').remove();
      }
    });
  }
};
