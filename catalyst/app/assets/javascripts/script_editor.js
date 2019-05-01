function ScriptEditor(textAreaId, script = null, opts = {}) {
  var defaultOpts = { 
    theme: 'twilight', 
    lang: 'javascript' 
  };
  this.defaultScript = '';
  this.opts = $.extend(defaultOpts, opts);
  this.elId = textAreaId;
  this.$el = $(textAreaId);
  this.load();

  this.decorator = this.$el.data('ace');
  this.editor = this.decorator.editor;
  this.ace = this.editor.ace;
  script = script || this.getElementValue();
  this.setValue(script);
  this.registerEvents();
}

ScriptEditor.prototype.load = function () { this.$el.ace(this.opts); };

ScriptEditor.prototype.setValue = function (script) {
  this.ace.setValue(script)    
};

ScriptEditor.prototype.getElementValue = function () {
  var val = this.defaultScript;
  try {
    val = this.$el.val();
  } catch (ex) { }
  return val;
};

ScriptEditor.prototype.getValue = function () {
  return this.ace.getValue().toString();
}

ScriptEditor.prototype.registerEvents = function() {
  var that = this;
  this.ace.on('change', function(e) {
    var script = that.defaultScript;
    try { script = that.getValue(); } catch(ex) { };
    that.$el.val(script);
  });
};