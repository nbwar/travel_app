function User(user_details){
  this.fname = user_details['first_name'];
  this.lname = user_details['last_name'];
  this.image = user_details['image'];
}

function UserView(user_details){
  this.node = $('#friends');
  this.row = "<div class='user_row'><img class='user_img' src="+ user_details['image'] +"<p class='user_name'>" + user_details['first_name'] + user_details['last_name'] + "</p><</div>";
  this.image = "<img class='user_img' src="+ user_details['image']+ ">";
}

UserView.prototype.renderRow = function() {
  this.node.append(this.row);
};

UserView.prototype.renderImage = function() {
  this.node.append(this.image);
};


function GroupMembers(user_details){
  this.members = user_details.map( function(info){ return new User(info); });
  console.log(this.members);
  this.view = new GroupMembersView();
}

function GroupMembersView(user_details){
  this.memberViews = user_details.map( function(details){return new UserView(details); });
  this.node = $('.member_add_table');
  this.view = "<div class='member_add_table'></div>";
  this.init();
}

GroupMembersView.prototype = {
  renderRows: function(){
    console.log('renderRows');
    for(var i =0; i < this.memberViews.length; i++){
      this.memberViews[i].renderRow();
    }
  },
  renderAddTable: function(){
    console.log('renderAddTable');
    $('body').append(this.view);
    this.renderRows();
  },
  renderImages: function(){
    console.log('renderImages');
    for(var i =0; i < this.memberViews.length; i++){
      console.log(this.memberViews[i]);
      this.memberViews[i].renderImage();
    }
  },
  addListeners: function(){
    that = this;
    $('body').on('click', '#add_friend', function(e){
      that.renderAddTable();
    });
  },
  init: function(){
    this.addListeners();
    this.renderImages();
  }
};


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
    $("body").on("click", "#book_listener", function(e) {
      e.preventDefault();
      groupController.bookings();
    });
  },
  suggestionsListener: function() {
    $("body").on("click", "#vote_listener", function(e) {
      e.preventDefault();
      groupController.suggestions();
    });
  },
  voteListener: function() {
    $("body").on("click", 'a.vote_cast', function(e) {
      e.preventDefault();
      console.log($(this));
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
      groupView.injectPartial(response);
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
      groupView.injectPartial(response);
    });
  }
};


var voteController = {
  castVote: function(linkEl) {
    var suggestionId = linkEl.data('suggestion');
    var choice = linkEl.data('choice');
    var data = {suggestion: suggestionId, choice: choice};
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

$(function() {

  var users = [{first_name:'Mo', last_name:'Latif', email:'m.latif@ee.ucl.ac.uk', image:'mo_latiff.jpg'},
  {first_name:'Nick', last_name:'Wargnier', email:'nwargnier@gmail.com', image: 'nick_wagnier.jpg'},
  {first_name:'Sai', last_name:'Arora', email:'sarora1190@gmail.com', image: 'sai_arora.jpg'}];
  console.log(users);
  var view_generator = new GroupMembersView(users);
  groupListeners.init();
  groupController.bookings();
});
