Taglee.Views.AlbumsIndex = Backbone.View.extend({
  template: JST['album/index'],

  initialize: function () {
    this.listenTo(this.collection, 'sync', this.render);
  },

  render: function () {
    var content = this.template({
      albums: this.collection
    });

    this.$el.html(content);
    return this;
  }
});
