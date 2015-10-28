window.Taglee = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    new Taglee.Routers.Router({
      $rootEl: $("#content"),
      albums: Taglee.Collections.albums
    });
    Backbone.history.start();
  }
};

$(document).ready(function(){
  Taglee.initialize();
});
