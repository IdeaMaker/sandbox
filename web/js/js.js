$(document).ready(function($) {

	/* sidebar menu */
	$('.menu li a').click(function() {
		var actual = $(this);
		if (actual.parent().find('ul').length) {
			if ( actual.next('ul.show').length ) {
				$('.menu li ul').removeClass('show').slideUp();
				return false;
			} else {
				$('.menu li ul').slideUp();
				actual.next('ul').addClass('show').slideDown();
				return false;
			}
		}
	});
    $("#slider-big").carouFredSel({
        prev : {
            button	: "#foo2_prev",
            key		: "left"
        },
        next : {
            button	: "#foo2_next",
            key		: "right"
        }
    });
    $("#slider-small").carouFredSel(
    {
        width : "585px",
        height : "90px",
        scroll : 3,
        items : {
            visible : 6,
            width : "89px",
            height: "66px"
        },
        prev : {
            button	: "#foo1_prev",
            key		: "left"
        },
        next : {
            button	: "#foo1_next",
            key		: "right"
        }
    });
});



