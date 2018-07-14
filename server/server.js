
var express = require('express');
const bluzelle = require('bluzelle');
var crypto = require('crypto');

// table and cell save at blockchain.
// /user/update
// /user/new
// /user/delete
// /user/read


var app = express();
bluzelle.connect('ws://testnet.bluzelle.com:51010', '45498479-2447-47a6-8c36-efa5d251a283');

app.get('/', function (req, res) {
    res.send('Hello World!');
});

app.get('/user/new', function (req, res) {
    bluzelle.create('#user_uuid', '[]').then(() => {
        res.send('user create');
    }).catch(e => console.log(e.message));
});
app.get('/user', function (req, res) {
    bluzelle.create('myKey2', 'myValue2').then(() => {
        res.send('Hello World!');
    }).catch(e => console.log(e.message));
});



app.listen(3000, function () {
  console.log('Example app listening on port 3000!');
});




