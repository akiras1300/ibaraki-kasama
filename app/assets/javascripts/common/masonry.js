$(document).on('turbolinks:load', function(){
  var $container = $('#masonry-container');
$container.imagesLoaded(function(){
	$container.masonry({
    itemSelector: '.mas-box',
    columnWidth: 350,
    gutterWidth: 5,
    isAnimated: true,
    isFitWidth: true
	  });
    $('.mas-box').hide();
    $('.mas-box').each(function(index) {
      $(this).delay(index * 50).css({display:'block',opacity:'0'}).animate({opacity:'1'},500);
    });
    });
    });
