$( document ).ready(function() {

	$('.navbar-nav > li > a').click(function(){
		console.log("you clicked navbar link " + this.innerHTML);
	    $('.navbar-nav > li').removeClass('active');
	    $(this).closest('li').addClass('active');
	}); 

});