Taglee.Routers.Router = Backbone.Router.extend({
  initialize: function (options) {
    this.$rootEl = options.$rootEl;
    // this.model = new Taglee.Models.User({id: Backbone.currentUserID});
    this.collection = new Taglee.Collections.Albums();
  },

  routes: {
    "": "profile",
    "album/new": "newAlbum",
    "album/:id": "showAlbum"
  },

  profile: function () {
    // this.model.fetch();
    this.collection.fetch();

    var indexView = new Taglee.Views.Profile({
      collection: this.collection
    });

    this._swapView(indexView);
  },

  newAlbum: function () {
    var newAlbum = new Taglee.Models.Album();

    var formView = new Taglee.Views.AlbumForm({
      collection: this.collection,
      model: newAlbum
    });

    this._swapView(formView);
  },

  showAlbum: function (id) {
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
