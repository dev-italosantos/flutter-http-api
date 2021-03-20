const mongoose = require('mongoose');

mongoose.connect('mongodb://127.0.0.1:27017/noderest', { 
    useNewUrlParser: true,
    useUnifiedTopology: true,
    useCreateIndex: true
});

mongoose.Promise = global.Promise;

console.log('MongoDB: Connected');

module.exports = mongoose;