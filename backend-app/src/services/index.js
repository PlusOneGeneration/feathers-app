module.exports = function () {
  const app = this; // eslint-disable-line no-unused-vars

  const mongoose = require('mongoose');
  const service = require('feathers-mongoose');

// A module that exports your Mongoose model
  const Model = require('./models/message')();

// Make Mongoose use the ES6 promise
  mongoose.Promise = global.Promise;

// Connect to a local database called `feathers`
  mongoose.connect(app.get('mongo').url);

  app.use('/messages', service({ Model }));

};
