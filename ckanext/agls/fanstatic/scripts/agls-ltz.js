"use strict";

ckan.module('agls-ltz', function($, _){
  return {
    options: {
      datetime: null,
      pattern: "LL, LT ([UTC]Z)"
    },
    initialize: function(){
      $.proxyAll(this, /_on/);
      var data_dt = this.options.datetime;
      var data_pattern = this.options.pattern;
      this._onLoad(data_dt, data_pattern);
    },
    _onLoad: function (data_datetime, data_pattern) {
      var browserLocale = window.navigator.userLanguage || window.navigator.language;
      jQuery(this.el).each(function() {
        moment.locale(browserLocale);
        var date = moment(data_datetime);
        if (date.isValid()) {
            jQuery(this).html(date.format(data_pattern));
        }
        jQuery(this).show();
      })
    }
  }
});
