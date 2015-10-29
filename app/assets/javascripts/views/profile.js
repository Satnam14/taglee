Taglee.Views.Profile = Backbone.View.extend({
  template: JST['profile/user_profile'],

  initialize: function () {
    this.listenTo(this.collection, 'add change remove reset sync', this.render);
  },

  events: {
    "click .delete": "destroyAlbum"
  },

  destroyAlbum: function (event) {
    var $target = $(event.currentTarget);
    var album = this.collection.get($target.attr("data-id"));
    album.destroy();
  },


  render: function () {
    var content = this.template({
      albums: this.collection
    });

    this.$el.html(content);
    return this;
  }
});
