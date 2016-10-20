(function($){
  $(function(){
    if( $('.button-collapse').length ){
      $('.button-collapse').sideNav();
    }

    if( $('.parallax').length > 0 ) {
      $('.parallax').parallax();
    }

    if( $('.container img').length ) {
      $('.container img').addClass( 'responsive-img' );
    }

    if( $('.container canvas').length ) {
      $('.container canvas').addClass( 'responsive-img' );
    }

  }); // end of document ready
})(jQuery); // end of jQuery name space
