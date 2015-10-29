Taglee.Views.AlbumShow = Backbone.View.extend({
  template: JST['album/show'],

  initialize: function () {
    this.listenTo(this.model, 'sync', this.render);
  },

  render: function () {
    var content = this.template({
      album: this.model
    });

    this.$el.html(content);
    return this;
  }
});
