pragma solidity ^0.4.11;

contract Template{

    struct template{

        uint8 templateKey;
        bytes32 templateName_kr;
        bytes32 templateName_en;
        uint x;
        uint y;

        uint8 tasteKey;
        bytes32[] name_kr;
        bytes32[] name_en;
        bytes32[] image_name;
        bytes32[] image_ipfs;

    }

    template[] public templateList;
    uint8 templateKey;

    constructor(){
        addTemplate('여행','Travel',3,3);
        addTemplate('음식','Food',3,3);
        addTemplate('데이트','Dating',3,3);

        //addTaste(0, '나홀로여행', 'AloneTravel', 'alonetravel.png', 'QmZ8x77VmjBMt5iZcfdsmCJU7WkHTkbeptgt3m9TDXSG4p');
        //addTaste(0, '디지털디톡스여행', 'DigitalDetoxTravel', 'digitaldetoxtravel.png', 'QmXnLteNK8JEcaZJ4M4XTud5QWqH3EBFjPHK3QBrDoim1Y');
        //addTaste(0, '트레킹여행', 'TrekkingTravel', 'trekkingtravel.png', 'QmXpc5hcg4cwvkLnEhnD9ymfjNtrVudKj7rd36WLQUcBGt');
        //addTaste(0, '홈스테이여행', 'HomestayTravel', 'homestaytravel.png', 'QmXEJrk7i4W1h31LzwxQHZepxNamyCq3MCifVm5Jb6QSH7');
        //addTaste(0, '힐링여행', 'HealingTravel', 'healingtravel.png','Qmb4xzjsgmha6yhV66MVXqGjyTs8mDzzTD3f9JN4QPbZbX');
        //addTaste(0, '수상스포츠여행', 'WaterSportsTravel', 'watersportstravel.png','QmZVoWR4ymFJzsQu1ij6vgnYJ7PMqoevzh8eCs9odeKCAW');
        //addTaste(0, '자선여행', 'VolunteerTravel', 'volunteertravel.png', 'QmTvSZMpDeEx2hhUPC2Gqb5HpUqZ1HWPSMb4g3b1dLbb8b');
        //addTaste(0, '음주여행', 'DrinkTravel', 'drinktravel.png', 'QmY6N55k9Ub34Rgak46iKW12g1C1hzwWZ5YNtcL8x1kKSj');
        //addTaste(0, '애완동물과여행', 'TravelWithPets', 'travelwithpets.png', 'Qma7Pq6RXacAobjbuFwPrM7vLyXXqxEKizRDd29dxU84go');

        //addTaste(1,'짜장면','Jajangmyeon','jajangmyeon.jpg','QmZuhD32MY1ZYRJzZ5HpUx9MzCkThpGkSspJ3YEEDKiqNa');
        //addTaste(1,'초밥','Sushi','sushi.jpg','QmRayC1eT8ZdGSpkqjNSAMQC3zed51vfTmGyYk7VKzBJZr');
        //addTaste(1,'삼겹살','PorkBelly','porkbelly.jpg','QmXowdFxfcGgBpQ38eNXsQtJEqSxLP11dVEvrp1RUj3mUJ');
        //addTaste(1,'커리','Curry','curry.jpg','QmagYZ9ZJXzgBu8oPX25MvqGNpqDEugfVfJT2aTjeqKxR1');
        //addTaste(1,'스테이크','Steak','steak.jpg','QmSyvcu1FwNzgvVFRDwQX6cEawJApjNCekkKVSTY1tTEx9');
        //addTaste(1,'냉면','ColdNoodles','coldnoodles.jpg','QmbDYM8wSr94KBnihwzCZUp2KcHnacDxZy3jVL1w4sMgof');
        //addTaste(1,'치킨','Chicken','chicken.jpg','QmV42Byrq9px1k8fMj1cMPg87fvYBWS8r8jZR15N6t8ddV');
        //addTaste(1,'라면','Ramen','ramen.jpg','QmavQJXQijSS25bQbtTsbTQoHSwozRykxPNViTXxvoEHKX');
        //addTaste(1,'떡볶이','Tteokbokki','tteokbokki.jpg','QmZ5rgyVmGbaDrotUM1yUMvgejUD5TiVzEh1NuGVxwLpvj');

        //addTaste(2,'놀이공원','AmusementPark','amusementpark.jpg','QmXgEDRpD23zbfevHLyxK3bwXcdvwZmYZJUk7yvro2tttT');
        //addTaste(2,'카페','Cafe','cafe.jpg','Qmd7X5QASJnQSsx8ydKEJZTQ3UXSn8AE8UfGApjoaCdnuh');
        //addTaste(2,'도시산책','CityWalk','citywalk.jpg','QmPVRDCrHkv3HJojiK7vvZcoQMkZZVce8RUFzFxQLwLyMs');
        //addTaste(2,'찜질방','KoreanSauna','koreansauna.jpg','Qme8JRgN3dvhAUHeDMkBcmcqY8w4g7uSfriaP21M1zYUQk');
        //addTaste(2,'극장','Theater','theater.jpg','QmeHTSDWxse3Nzc2F7nGpzfSg5bdkz4JGhqUUEQiRcmikd');
        //addTaste(2,'바다','Sea','sea.jpg','QmRWTNLXm2AD9FJR8h7fSWVuhXUGqdXCvJxGKDrEh4yRSF');
        //addTaste(2,'술','Alcohol','alcohol.jpg','QmRZw2psnke7Y7oYBCzHfH4FsDnEEkZSCeNGng5xmo9yG9');
        //addTaste(2,'노래방','Karaoke','karaoke.jpg','QmWRwbj9CFp4THamVtZQHPwKjQ12PEo6gB8PuTmdY1D1Ht');
        //addTaste(2,'운동','Exercise','exercise.jpg','QmQGw4XTX33rUSYWFgKtME7XWifQ94o71iBKMRkpGqJAfW');
    }

    //Template.deployed().then(function(instance){instance.addTemplate("음식","Food",3,3)});
    function addTemplate(bytes32 _templateName_kr, bytes32 _templateName_en,uint _x, uint _y)
    {
        template memory addtemp;
        addtemp.templateName_kr = _templateName_kr;
        addtemp.templateName_en = _templateName_en;
        addtemp.x = _x;
        addtemp.y = _y;

        templateList.push(addtemp);
    }

    //Template.deployed().then(function(instance){ return instance.getTemplate.call(0)}).then(function(v){return v[0].toString()}).then(function(value) {return web3.toAscii(value).replace(/\u0000/g, '')});
    //Template.deployed().then(function(instance){ return instance.getTemplate.call(0)}).then(function(v){return v[1].toString()}).then(function(value) {return web3.toAscii(value).replace(/\u0000/g, '')});
    //Template.deployed().then(function(instance){ return instance.getTemplate.call(0)}).then(function(v){return v[2]}).then(function(value) {return value.toNumber();});
    //Template.deployed().then(function(instance){ return instance.getTemplate.call(0)}).then(function(v){return v[3]}).then(function(value) {return value.toNumber();});
    function getTemplate(uint8 temlateKey)
    public view returns(bytes32 templateName_kr, bytes32 templateName_en, uint x, uint y)
    {
        return(templateList[templateKey].templateName_kr, templateList[templateKey].templateName_en, templateList[templateKey].x, templateList[templateKey].y);
    }


    //Template.deployed().then(function(instance){instance.addTaste(0,"치킨","Chicken", "image.jpg","IPFS:Chicken")});
    function addTaste(uint tid, bytes32 _name_kr, bytes32 _name_en, bytes32 _image_name, bytes32 _image_ipfs){
        templateList[tid].name_kr.push(_name_kr);
        templateList[tid].name_en.push(_name_en);
        templateList[tid].image_name.push(_image_name);
        templateList[tid].image_ipfs.push(_image_ipfs);
    }

    //Template.deployed().then(function(instance){ return instance.getTemplateTasteA.call(0)}).then(function(v){return v[0]});
    function getTemplateTasteA(uint8 templateKey) public view returns(bytes32[] name_kr){
        return(templateList[templateKey].name_kr);
    }
    //Template.deployed().then(function(instance){ return instance.getTemplateTasteB.call(0)}).then(function(v){return v[0]});
    function getTemplateTasteB(uint8 templateKey) public view returns(bytes32[] name_en){
        return(templateList[templateKey].name_en);
    }
    //Template.deployed().then(function(instance){ return instance.getTemplateTasteC.call(0)}).then(function(v){return v[0]});
    function getTemplateTasteC(uint8 templateKey) public view returns(bytes32[] name_kr){
        return(templateList[templateKey].name_kr);
    }
    //Template.deployed().then(function(instance){ return instance.getTemplateTasteD.call(0)}).then(function(v){return v[0]});
    function getTemplateTasteD(uint8 templateKey) public view returns(bytes32[] name_kr){
        return(templateList[templateKey].name_kr);
    }

}