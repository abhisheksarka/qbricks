window.sharedExports = {};

(function () {
  function SiteConnect (formId, modalId) {
    var that = this;
    this.$form = $(formId);
    this.$modal = $(modalId);

    this.$formBox = this.$form.find('.form-box');
    this.$successBox = this.$form.find('.success-box');
    this.$successBox.hide();

    this.$err = this.$form.find('.error');
    this.$err.hide();

    this.$loader = this.$form.find(".in-progress");
    this.$loader.hide();

    this.$submitBtn = this.$form.find("input[type='submit']");
    this.action = this.$form.attr('action');
    this.$form.submit(
      function (e) { that.onSubmit.apply(that, [e]) }
    );
  };
  var proto = SiteConnect.prototype;

  proto.onSubmit = function (e) {
    var that = this;

    e.preventDefault();

    that.$err.hide();
    that.$loader.show();
    that.$submitBtn.hide();

    $.post(this.action, this.$form.serialize())
    .done(function (res) { that.onDone.apply(that, [res]) })
    .fail(function (res) { that.onFail.apply(that, [res]) })
    .always(function() { that.reset.apply(that); })
  };
  
  proto.onDone = function (res) {
    this.$successBox.show();
    this.$formBox.hide();
  };

  proto.onFail = function (res) {
    this.$err.show();
  };

  proto.reset = function () {
    this.$loader.hide();
    this.$submitBtn.show();
    this.$submitBtn.val('Connect');
    this.$submitBtn.prop('disabled', false);
  };

  window.sharedExports.SiteConnect = SiteConnect;
}());