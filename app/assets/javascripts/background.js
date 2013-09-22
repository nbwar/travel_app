$(document).ready(function(){
    console.log("adding background");

    var bgImageTotal=5;

    var randomNumber = Math.round(Math.random()*(bgImageTotal-1))+1;

    var imgPath=('em'+randomNumber+'.jpg');
    if(randomNumber === 3){
        $('.advent').css('color','black');
        $('.slogan').css('color','black');
    }
    $('body').css('background-image', ('url("'+imgPath+'")'));

});