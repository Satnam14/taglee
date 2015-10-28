  Taglee.Views.AlbumsIndex = Backbone.Views.extend({
    template: JST['albums/index'],

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
