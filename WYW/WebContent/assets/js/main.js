/*
	Visualize by TEMPLATED
	templated.co @templatedco
	Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
*/



const getJSON = function(url, callback){
    const xhr = new XMLHttpRequest();
    xhr.open('GET', url, true);
    xhr.responseType = 'json';
    xhr.onload = function(){
        
        const status = xhr.status;
        if(status === 200){
            callback(null, xhr.response);
        }else{
            callback(status, xhr.response);
        }
    };
    xhr.send();
};


$(document).ready(function(){
	$("#city").change(function(){
		var selectCity = $(this).val();
		console.log(selectCity);
		
		var url = 'http://api.openweathermap.org/data/2.5/weather?q='+selectCity+'&appid=d3689315a68c7fb612f372f174579300&units=metric';
		
		getJSON(url, function(err, data){
			if(err !== null){
				alert("오류 발생");
			}else{
				loadWeather(data);
				iconDaily(data);
			}
		});
	});
});
		
	function loadWeather(data){		
		var date = new Date();
		var month = date.getMonth() + 1;
		var day = date.getDate();
		var hours = date.getHours();
		var minutes = date.getMinutes();
		
		$(".location").html(`현재 위치 : ${data.name}, KR`);
		$(".current-temp").html(`현재 온도 : ${data.main.temp}º`);
		$(".feels-like").html(`체감온도 : ${data.main.feels_like}º`);
		$(".current-time").html(`${month}월 ${day}일 ${hours}:${minutes} 기준`);
	}
	
	function iconDaily(data){
		var temp = `${data.main.temp}`;
		var icon = document.querySelector('.icon');
		
		if(temp < 5){
			icon.innerHTML = "<img src='images/clothing-icon/winter-hat.png' width='150px' height='150px'>"+
							"<img src='images/clothing-icon/padded-jacket.png' width='150px' height='150px'>";
		
		}else if(temp >= 5 && temp < 9 ){
			icon.innerHTML = "<img src='images/clothing-icon/padded-jacket.png' width='150px' height='150px'>"+
							"<img src='images/clothing-icon/jeans.png' width='150px' height='150px'>";
		
		}else if(temp >= 9 && temp < 12){
			icon.innerHTML = "<img src='images/clothing-icon/trench-coat.png' width='150px' height='150px'>"+
							"<img src='images/clothing-icon/jeans.png' width='150px' height='150px'>";
		
		}else if(temp >= 12 && temp < 17){
			icon.innerHTML = "<img src='images/clothing-icon/hoodie.png' width='150px' height='150px'>"+
							"<img src='images/clothing-icon/jeans.png' width='150px' height='150px'>";
		
		}else if(temp >= 17 && temp < 20){
			icon.innerHTML = "<img src='images/clothing-icon/sweater.png' width='150px' height='150px'>"+
							"<img src='images/clothing-icon/jeans.png' width='150px' height='150px'>";
		
		}else if(temp >= 20 && temp < 23){
			icon.innerHTML = "<img src='images/clothing-icon/short-sleeve.png' width='150px' height='150px'>"+
							"<img src='images/clothing-icon/jeans.png' width='150px' height='150px'>";
		
		}else if(temp >= 23 && temp < 28){
			icon.innerHTML = "<img src='images/clothing-icon/short-sleeve.png' width='150px' height='150px'>"+
							"<img src='images/clothing-icon/shorts.png' width='150px' height='150px'>";
		
		}else if(temp >= 28){
			icon.innerHTML = "<img src='images/clothing-icon/sleeveless.png' width='150px' height='150px'>"+
							"<img src='images/clothing-icon/shorts.png' width='150px' height='150px'>";
		}
		
	}





$(function() {

	// Vars.
		var	$window = $(window),
			$body = $('body'),
			$wrapper = $('#wrapper');

	// Breakpoints.
		skel.breakpoints({
			xlarge:	'(max-width: 1680px)',
			large:	'(max-width: 1280px)',
			medium:	'(max-width: 980px)',
			small:	'(max-width: 736px)',
			xsmall:	'(max-width: 480px)'
		});

	// Disable animations/transitions until everything's loaded.
		$body.addClass('is-loading');

		$window.on('load', function() {
			$body.removeClass('is-loading');
		});

	// Poptrox.
		$window.on('load', function() {

			$('.thumbnails').poptrox({
				onPopupClose: function() { $body.removeClass('is-covered'); },
				onPopupOpen: function() { $body.addClass('is-covered'); },
				baseZIndex: 10001,
				useBodyOverflow: false,
				usePopupEasyClose: true,
				overlayColor: '#000000',
				overlayOpacity: 0.75,
				popupLoaderText: '',
				fadeSpeed: 500,
				usePopupDefaultStyling: false,
				windowMargin: (skel.breakpoint('small').active ? 5 : 50)
			});

		});

});