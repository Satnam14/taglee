Taglee.Views.Profile = Backbone.View.extend({
  template: JST['profile/user_profile'],

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
