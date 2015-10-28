Taglee.Collections.Media = Backbone.Collection.extend({
  url: '/api/media',
  model: Taglee.Models.Medium,

  getOrFetch: function (id) {
    var medium = this.get(id);

    if (!medium) {
      medium = new Taglee.Models.Medium({ id: id });
      medium.fetch({
        success: function () {
          this.add(medium);
        }.bind(this)
      });
    } else {
      medium.fetch();
    }

    return medium;
  }
});
