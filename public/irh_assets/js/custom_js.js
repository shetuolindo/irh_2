
var catagoriBlock = document.querySelectorAll(".catagori_demo");


for(var i=0; i<catagoriBlock.length; i++){

	var remainder = i%2;
	if(remainder > 0 ){
		catagoriBlock[i].className = "col-md-2 col-sm-6 categorybox p-3 catagori_demo red";
		catagoriBlock[i].setAttribute("data-aos" , 'fade-in'); 
	} else {
		catagoriBlock[i].className = "col-md-2 col-sm-6 categorybox p-3 catagori_demo yello";
		catagoriBlock[i].setAttribute("data-aos" , "fade-down"); 
	}
	
}


var adminFaqLink = document.querySelectorAll("a.get_questions");
var adminFaqTr = document.querySelectorAll("#faq_main_table tbody tr");

for(var i=0; i<adminFaqLink.length; i++){
	
	adminFaqLink[i].onclick = function doit() {

		for(var e=0; e<adminFaqTr.length; e++){
			adminFaqTr[e].style.background = '#fff';
		}

		this.parentElement.parentNode.style.background = '#fee59d';
	};
}




var checkBoxEditResource = document.getElementById("generate_preview_attachment");
var uploadImgCover = document.getElementById("preview_attachment_div"); 
var fileUploadCover = document.getElementById("preview_attachment");
var text = document.getElementById("text");
checkBoxEditResource.onclick = function(){
if (checkBoxEditResource.checked == true){
	//uploadImgCover.style.display = "block";
	uploadImgCover.classList.add("coverCustomStyl");
	fileUploadCover.disabled = true;
} else {
	//uploadImgCover.style.display = "none";
	uploadImgCover.classList.remove("coverCustomStyl");
	fileUploadCover.disabled = false;
	
}
}








	









