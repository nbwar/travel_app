$(document).ready(function(){
    console.log("adding background");

    var bgImageTotal=5;

    var randomNumber = Math.round(Math.random()*(bgImageTotal-1))+1;

    var imgPath=('em'+randomNumber+'.jpg');

    $('body').css('background-image', ('url("'+imgPath+'")'));
});