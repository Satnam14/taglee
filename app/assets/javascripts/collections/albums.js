Taglee.Collections.Albums = Backbone.Collection.extend({
  url: '/api/albums',
  model: Taglee.Models.Album,

  getOrFetch: function (id) {
    var album = this.get(id);

    if (!album) {
      album = new Taglee.Models.Album({ id: id });
      album.fetch({
        success: function () {
          this.add(album);
        }.bind(this)
      });
    } else {
      album.fetch();
    }

    return album;
  }
});
