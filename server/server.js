
var express = require('express');
const bluzelle = require('bluzelle');
var crypto = require('crypto');
function guid() {
    function s4() {
      return Math.floor((1 + Math.random()) * 0x10000)
        .toString(16)
        .substring(1);
    }
    return s4() + s4() + '-' + s4() + '-' + s4() + '-' + s4() + '-' + s4() + s4() + s4();
  }
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

app.get('/user/all', function (req, res) {
    var user_id = req.param('user_uuid');

    bluzelle.read('#user_uuid_all_'+user_id).then(value => {
        res.send(value);
    }).catch(e => console.log(e.message));
})

app.get('/user/new', function (req, res) {
    var user_id = req.param('user_uuid');
    var data = req.param('data');
    // 리드 해서 지금 까지 취향 가져오고 
    // 거기에서 마지막에 인덱스 하나 추가 하고 
    // 그걸 기준으로 인덱스 조회해서 데이터 가져오고 
    
    // bluzelle.create('#user_uuid_all_'+user_id, '[]').then(value => {
        bluzelle.read('#user_uuid_all_'+user_id).then(value => {
            var new_uuid = guid();

            var new_all = JSON.parse(value)

            console.log('new_all111')
            console.log(new Array(new_all))

            new_all = new Array(new_all).push(new_uuid)

            console.log('new_uuid')
            console.log(new_uuid)
            console.log('new_all1')
            console.log(new_all)
            bluzelle.update('#user_uuid_all_'+user_id, JSON.stringify(new_all)).then(() => {

                console.log('new_all2')
                console.log(new_all)
                console.log('#user_uuid_all'+user_id)
                bluzelle.create('#user_uuid_'+new_uuid, JSON.stringify(data)).then(() => {

                    console.log('data')
                    // console.log(data)??
                    res.send('user_uuid_all updated & data added');
                }).catch(e => console.log(e.message));
                // res.send('user_uuid_all updated');
            }).catch(e => console.log(e.message));

            res.send(value);

            console.log(value); // 'myValue'
        }).catch(e => console.log(e.message));
    // }).catch(e => console.log(e.message));

    
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




