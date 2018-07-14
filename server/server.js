
var express = require('express');

const bluzelle = require('bluzelle');



var app = express();

app.get('/', function (req, res) {
    bluzelle.connect('ws://testnet.bluzelle.com:51010', '45498479-2447-47a6-8c36-efa5d251a283');
    bluzelle.read('myKey').then(value => {
        console.log(value); // 'myValue'
        res.send(value);
    }).catch(e => console.log(e.message));
});

app.get('/test', function (req, res) {
    bluzelle.connect('ws://testnet.bluzelle.com:51010', '45498479-2447-47a6-8c36-efa5d251a283');
    bluzelle.create('myKey2', 'myValue2').then(() => {
        res.send('Hello World!');
    }).catch(e => 
        console.log(e.message)
    );
});

app.listen(3000, function () {
  console.log('Example app listening on port 3000!');
});




