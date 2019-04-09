function JSONEditorInit(elId) {
  this.elId = elId;
  this.$el = $(elId)
  this.editor = new JsonEditor(elId, this.getJSON());
};

JSONEditorInit.prototype.getJSON = function() { 
  try {
    return JSON.parse(this.$el.val());
  } catch(ex) { }
};

JSONEditorInit.prototype.load = function() {
  var that = this;
  this.$el.on('change', function () {
    that.editor.load(that.getJSON());
  });
}

