module.exports = () => {
  const mongoose = require('mongoose');

  const Schema = mongoose.Schema;
  const MessageSchema = new Schema({
    text: String
  });
  const Model = mongoose.model('Message', MessageSchema);
  return Model;
};
