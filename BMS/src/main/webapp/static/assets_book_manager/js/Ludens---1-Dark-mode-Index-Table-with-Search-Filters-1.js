"use strict";

// RIPPLES EFFECT
function ripplesEffect(e) {
    var waves, d, x, y;
    
    if($(this).find('.waves').length === 0) {
        $(this).prepend('<span class="waves"></span>');
    }
     
    waves = $(this).find('.waves');
    waves.removeClass('ripple');
     
    if(!waves.height() && !waves.width()) {
        d = Math.max($(this).outerWidth(), $(this).outerHeight());
        waves.css({height: d, width: d});
    }
    
    x = e.pageX - $(this).offset().left - waves.width()/2;
    y = e.pageY - $(this).offset().top - waves.height()/2;
     
    waves.css({top: y+'px', left: x+'px'}).addClass('ripple');
};

$(document).ready(function(){
    $('.btnMaterial, .ripples').on('click', ripplesEffect);
});