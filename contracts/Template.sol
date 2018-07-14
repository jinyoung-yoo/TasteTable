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

    //Template.deployed().then(function(instance){instance.addTemplate('음식','Food',3,3)});
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