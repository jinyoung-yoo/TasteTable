
var express = require('express');
const bluzelle = require('bluzelle');
var crypto = require('crypto');

// table and cell save at blockchain.
// /user/new
// /user/delete
// /user/read


var app = express();
bluzelle.connect('ws://testnet.bluzelle.com:51010', '45498479-2447-47a6-8c36-efa5d251a283');

app.all('/*', function(req, res, next) {
    res.header("Access-Control-Allow-Origin", "*");
    res.header("Access-Control-Allow-Headers", "X-Requested-With");
    next();
  });

  
app.get('/', function (req, res) {
    res.send('Hello World!');
});

app.get('/user/new', function (req, res) {
    var user_id = req.param('user_uuid');
    var data = req.param('data');

    bluzelle.create('#user_uuid_'+user_id, data).then(() => {
        res.send('user create');
    }).catch(e => console.log(e.message));
});

app.get('/user/modify', function (req, res) {
    var user_id = req.param('user_uuid');
    var data = req.param('data');

    bluzelle.update('#user_uuid_'+user_id, data).then(() => {
        res.send('user create');
    }).catch(e => console.log(e.message));
});

app.get('/user/get', function (req, res) {
    // http://example.com/user/get?user_uuid=41212312312312312313123

    var user_id = req.param('user_uuid');

    bluzelle.read('#user_uuid_'+user_id).then(value => {
        res.send(value);
        console.log(value); // 'myValue'
    }).catch(e => console.log(e.message));
});



app.listen(3000, function () {
  console.log('Example app listening on port 3000!');
});




