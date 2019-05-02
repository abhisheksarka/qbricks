function JSONEditor(textAreaId, json = null, opts = {}) {
  var defaultOpts = { 
    theme: 'twilight', 
    lang: 'json' 
  };
  this.opts = $.extend(defaultOpts, opts);
  this.elId = textAreaId;
  this.$el = $(textAreaId);
  this.load();

  this.decorator = this.$el.data('ace');
  this.editor = this.decorator.editor;
  this.ace = this.editor.ace;
  json = json || this.getElementValue();
  this.setValue(json);
  this.registerEvents();
}

JSONEditor.prototype.load = function () { this.$el.ace(this.opts); };

JSONEditor.prototype.setValue = function (json) {
  this.ace.setValue(JSON.stringify(json, null, '\t'))    
};

JSONEditor.prototype.getElementValue = function () {
  var val = {};
  try {
    val = JSON.parse(this.$el.val());
  } catch (ex) { }
  return val;
};

JSONEditor.prototype.getValue = function (json) {
  return JSON.parse(this.ace.getValue().toString());
}

JSONEditor.prototype.registerEvents = function() {
  var that = this;
  this.ace.on('change', function(e) {
    var json;
    try { 
      json = that.getValue(); 
      that.$el.val(JSON.stringify(json));
    } catch(ex) { 
      
    };
  });
};