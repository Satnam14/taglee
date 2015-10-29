Taglee.Models.Album = Backbone.Model.extend({
  urlRoot: '/api/albums',

  media: function () {
    if (!this._media) {
      this._media = new Taglee.Collections.Media([], { album: this });
    }

    return this._media;
  },

  parse: function (response) {
    if (response.media) {
      this.media().set(response.media, { parse: true });
      delete response.media;
    }
  }
});
