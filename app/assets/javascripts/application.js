// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require materialize
//= require materialize-form
//= require riot
//= require riot_rails
//= require lodash
//= require_tree .

(function(){

  var app = riot.observable();

  //app.getData タグからdata-○○属性を取得
  //----------------------------------------------------------------
  app.getData = function (dom, name) {
    if (!document.createElement('div').dataset) {
      return dom.getAttribute('data-' + name);
    }
    return dom.dataset[name];
  };

  //app._createCollection リモートからデータをAjaxで取得して、モデル群を保持
  //----------------------------------------------------------------
  app._createCollection = function (opts) {
    var collection = riot.observable(),
      opts = opts || {};

    _.extend(collection,
      {
        remote: opts.remote,
        params: '',
        models: []
      },
      opts.methods
    );

    collection.isReady = function () {
      return (this.models.length > 0);
    };

    collection.on('get', function (callback) {
      var co = this;
      ajax('?' + co.params, 'get', null, function (models) {
        co.models = models;
        if (typeof callback === 'function') callback(models);
      });
    });

    collection.on('get_one', function (id, callback) {
      var co = this;
      if (typeof id !== 'number') return;
      ajax('/' + id, 'get', null, function (model) {
        var index = _.findIndex(co.models, ['id', id]);
        co.models[index] = model;
        if (typeof callback === 'function') callback(model);
      });
    });

    collection.on('post', function (params, callback) {
      if (!params) return;
      ajax('/', 'post', params, callback);
    });

    collection.on('patch', function (id, params, callback) {
      if (typeof id !== 'number' || !params) return;
      ajax('/' + id, 'put', params, callback);
    });

    collection.on('delete', function (id, callback) {
      if (typeof id !== 'number') return;
      ajax('/' + id, 'delete', null, callback);
    });

    var ajax = function(path, method, params, callback) {
      if (typeof path !== 'string') return;
      else if (typeof method !== 'string') return;

      var co = collection;

      $.ajax({
        url: co.remote + path,
        data: params,
        method: method,
        dataType: 'json',
        success: function (res) {
          if (typeof callback === 'function') callback(res);

          if (method === 'get') co.trigger('updated');
          else                  co.trigger('get');
        }
      });
    };

    collection.trigger('get'); //あとでrouteと合わせてparamを連動するよう修正

    return collection;
  };

  //----------------------------------------------------------------
  //----------------------------------------------------------------

  app.collections = {
    entries: app._createCollection({
      remote: '/api/entries'
    })
  };

  riot.mixin('app', { app: app });

})();
