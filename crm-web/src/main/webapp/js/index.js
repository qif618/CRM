$(function(){
    //菜单点击
    J_iframe
    $(".J_menuItem").on('click',function(){
    	//$(this).addClass("aa");让啊标签active
        var url = $(this).attr('href');
        $("#J_iframe").attr('src',url);
        var text = $(this).text();
        $("#myTitlediv").text(text);//对右侧标题赋值
        return false;
    });
    
    /* --------------------------------------------------------
	Template Settings
    -----------------------------------------------------------*/
    
    var settings =  '<a id="settings" href="#changeSkin" data-toggle="modal">' +
			'<i class="fa fa-gear"></i> Change Skin' +
		    '</a>' +   
		    '<div class="modal fade" id="changeSkin" tabindex="-1" role="dialog" aria-hidden="true">' +
			'<div class="modal-dialog modal-lg">' +
			    '<div class="modal-content">' +
				'<div class="modal-header">' +
				    '<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>' +
				    '<h4 class="modal-title">Change Template Skin</h4>' +
				'</div>' +
				'<div class="modal-body">' +
				    '<div class="row template-skins">' +
					'<a data-skin="skin-blur-violate" class="col-sm-2 col-xs-4" href="">' +
					    '<img src="img/skin-violate.jpg" alt="">' +
					'</a>' +
					'<a data-skin="skin-blur-lights" class="col-sm-2 col-xs-4" href="">' +
					    '<img src="img/skin-lights.jpg" alt="">' +
					'</a>' +
					'<a data-skin="skin-blur-city" class="col-sm-2 col-xs-4" href="">' +
					    '<img src="img/skin-city.jpg" alt="">' +
					'</a>' +
					'<a data-skin="skin-blur-greenish" class="col-sm-2 col-xs-4" href="">' +
					    '<img src="img/skin-greenish.jpg" alt="">' +
					'</a>' +
					'<a data-skin="skin-blur-night" class="col-sm-2 col-xs-4" href="">' +
					    '<img src="img/skin-night.jpg" alt="">' +
					'</a>' +
					'<a data-skin="skin-blur-blue" class="col-sm-2 col-xs-4" href="">' +
					    '<img src="img/skin-blue.jpg" alt="">' +
					'</a>' +
					'<a data-skin="skin-blur-sunny" class="col-sm-2 col-xs-4" href="">' +
					    '<img src="img/skin-sunny.jpg" alt="">' +
					'</a>' +
					'<a data-skin="skin-blur-cloth" class="col-sm-2 col-xs-4" href="">' +
					    '<img src="img/skin-cloth.jpg" alt="">' +
					'</a>' +
					'<a data-skin="skin-blur-tectile" class="col-sm-2 col-xs-4" href="">' +
					    '<img src="img/skin-tectile.jpg" alt="">' +
					'</a>' +
					'<a data-skin="skin-blur-chrome" class="col-sm-2 col-xs-4" href="">' +
					    '<img src="img/skin-chrome.jpg" alt="">' +
					'</a>' +
					'<a data-skin="skin-blur-ocean" class="col-sm-2 col-xs-4" href="">' +
					    '<img src="img/skin-ocean.jpg" alt="">' +
					'</a>' +
					'<a data-skin="skin-blur-sunset" class="col-sm-2 col-xs-4" href="">' +
					    '<img src="img/skin-sunset.jpg" alt="">' +
					'</a>' +
					'<a data-skin="skin-blur-yellow" class="col-sm-2 col-xs-4" href="">' +
					    '<img src="img/skin-yellow.jpg" alt="">' +
					'</a>' +
					'<a  data-skin="skin-blur-kiwi"class="col-sm-2 col-xs-4" href="">' +
					    '<img src="img/skin-kiwi.jpg" alt="">' +
					'</a>' +
				    '</div>' +
				'</div>' +
			    '</div>' +
			'</div>' +
		    '</div>';
    $('#content-main').prepend(settings);
            
    $('body').on('click', '.template-skins > a', function(e){
		e.preventDefault();
		var skin = $(this).data('skin');
		if(skin=="skin-blur-violate"){
			$(".changeSkin").css("background-image","url(img/body/violate.jpg)");
		}else if(skin=="skin-blur-lights"){
			$(".changeSkin").css("background-image","url(img/body/lights.jpg)");
		}else if(skin=="skin-blur-city"){
			$(".changeSkin").css("background-image","url(img/body/city.jpg)");
		}else if(skin=="skin-blur-greenish"){
			$(".changeSkin").css("background-image","url(img/body/greenish.jpg)");
		}else if(skin=="skin-blur-night"){
			$(".changeSkin").css("background-image","url(img/body/night.jpg)");
		}else if(skin=="skin-blur-sunny"){
			$(".changeSkin").css("background-image","url(img/body/sunny.jpg)");
		}else if(skin=="skin-blur-blue"){
			$(".changeSkin").css("background-image","url(img/body/blue.jpg)");
		}else if(skin=="skin-blur-chrome"){
			$(".changeSkin").css("background-image","url(img/body/chrome.jpg)");
		}else if(skin=="skin-blur-ocean"){
			$(".changeSkin").css("background-image","url(img/body/ocean.jpg)");
		}else if(skin=="skin-blur-sunset"){
			$(".changeSkin").css("background-image","url(img/body/sunset.jpg)");
		}else if(skin=="skin-blur-yellow"){
			$(".changeSkin").css("background-image","url(img/body/yellow.jpg)");
		}else if(skin=="skin-blur-kiwi"){
			$(".changeSkin").css("background-image","url(img/body/kiwi.jpg)");
		}else if(skin=="skin-blur-cloth"){
			$(".changeSkin").css("background-image","url(img/body/cloth.jpg)");
		}else if(skin=="skin-blur-tectile"){
			$(".changeSkin").css("background-image","url(img/body/tectile.jpg)");
		}
		$('#changeSkin').modal('hide');
    });
    
});

/* --------------------------------------------------------
Calendar
-----------------------------------------------------------*/
(function(){

    //Sidebar
    if ($('#sidebar-calendar')[0]) {
        var date = new Date();
        var d = date.getDate();
        var m = date.getMonth();
        var y = date.getFullYear();
        $('#sidebar-calendar').fullCalendar({
            editable: false,
            events: [],
            header: {
                left: 'title'
            }
        });
    }

    //Content widget
    if ($('#calendar-widget')[0]) {
        $('#calendar-widget').fullCalendar({
            header: {
                left: 'title',
                right: 'prev, next',
                //right: 'month,basicWeek,basicDay'
            },
            editable: true,
            events: [
                {
                    title: 'All Day Event',
                    start: new Date(y, m, 1)
                },
                {
                    title: 'Long Event',
                    start: new Date(y, m, d-5),
                    end: new Date(y, m, d-2)
                },
                {
                    title: 'Repeat Event',
                    start: new Date(y, m, 3),
                    allDay: false
                },
                {
                    title: 'Repeat Event',
                    start: new Date(y, m, 4),
                    allDay: false
                }
            ]
        });
    }

})();
/* --------------------------------------------------------
Date Time Widget
-----------------------------------------------------------*/
(function(){
    var monthNames = [ "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December" ];
    var dayNames= ["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"]

    // Create a newDate() object
    var newDate = new Date();

    // Extract the current date from Date object
    newDate.setDate(newDate.getDate());

    // Output the day, date, month and year
    $('#date').html(dayNames[newDate.getDay()] + " " + newDate.getDate() + ' ' + monthNames[newDate.getMonth()] + ' ' + newDate.getFullYear());
    
    setInterval( function() {

        // Create a newDate() object and extract the seconds of the current time on the visitor's
        var seconds = new Date().getSeconds();

        // Add a leading zero to seconds value
        $("#sec").html(( seconds < 10 ? "0":"" ) + seconds);
    },1000);

    setInterval( function() {

        // Create a newDate() object and extract the minutes of the current time on the visitor's
        var minutes = new Date().getMinutes();

        // Add a leading zero to the minutes value
        $("#min").html(( minutes < 10 ? "0":"" ) + minutes);
    },1000);

    setInterval( function() {

        // Create a newDate() object and extract the hours of the current time on the visitor's
        var hours = new Date().getHours();
        // Add a leading zero to the hours value
        $("#hours").html(( hours < 10 ? "0" : "" ) + hours);
    }, 1000);
})();














