

function resiZeFun(){
	
	var slid = document.getElementById('slider_sec'); /*long slide*/
	var slidBox = document.querySelectorAll('.box_slider'); /*per slide*/
	var prv = document.querySelector('img.prv'); /*btn_PRV*/
	var nxt = document.querySelector('img.nxt'); /*btn_NXT*/
	var index = 0;
	//var w = window.outerWidth;
	
	
	var mainSliderWidth = 33.33;
	var sliderWidth = 100 / slidBox.length;
	
	function sliderSetting(){
		for(var i=0; i<slidBox.length; i++){
			slidBox[i].style.width = ''+sliderWidth+'%';
		}
	
	
	
		function showSlide(index){
			var sliderWidthCalcu = (mainSliderWidth * slidBox.length);
			var slidPerClickMov = (index * sliderWidth * -1);
				slid.style.width = ''+sliderWidthCalcu+'%';
				slid.style.transform = 'translateX('+slidPerClickMov+'%)';
				slid.style.transition = '.2s all ease-in-out';
	
		}
	
		
	
	
		prv.onclick = function(){
			if(0 < index){
				index --
				showSlide(index)
			} else {
				index = slidBox.length - 3;
				showSlide(index)
			}
		}
	
	
	
		nxt.onclick = function(){
			if(index < slidBox.length - 3){
				index ++
				showSlide(index)
			} else {
				index = 0;
				showSlide(index)
			}
		}
	
	
		showSlide(0);
	
	}
	
	
	
	sliderSetting();
	
	}
	
	
	
	resiZeFun();
	
	
	
	
	
	