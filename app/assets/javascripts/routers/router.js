Taglee.Routers.Router = Backbone.Router.extend({
  initialize: function (options) {
    this.$rootEl = options.$rootEl;
    this.collection = options.posts;
  },

  routes: {
    "": "index",
    "albums/new": "new",
    "albums/:id": "show"
  },

  index: function () {
    this.collection.fetch();

    var indexView = new Taglee.Views.AlbumsIndex({
      collection: this.collection
    });

    this._swapView(indexView);
  },

  new: function () {
    var newAlbum = new Taglee.Models.Album();

    var formView = new Taglee.Views.AlbumForm({
      collection: this.collection,
      model: newAlbum
    });

    this._swapView(formView);
  },

  show: function (id) {
    var album = this.collection.getOrFetch(id);
    var formView = new Taglee.Views.AlbumShow({ model: album });
    this._swapView(formView);
  },

  _swapView: function (view) {
    this._currentView && this._currentView.remove();
    this._currentView = view;
    this.$rootEl.html(view.render().$el);
  }
});
