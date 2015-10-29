Taglee.Views.AlbumForm = Backbone.View.extend({
  template: JST['album/new'],
  tagName: 'form',
  className: 'new-album',

  events: {
    'click button': 'submit'
  },

  submit: function (event) {
    event.preventDefault();
    var attrs = this.$el.serializeJSON();
    var that = this;
    this.model.save(attrs, {
      success: function () {
        // that.collection.add(that.model, { merge: true });
        // Backbone.history.navigate("", { trigger: true });
      }
    });
  },

  render: function () {
    var content = this.template({
      album: this.model
    });

    this.$el.html(content);
    return this;
  }
});
