let CommentsBtn = document.querySelector(".comments");
let CommentsPanel = document.querySelector(".container-comments");

CommentsPanel.style.display="none";

CommentsBtn.addEventListener("click", () => {
	
CommentsPanel.style.display == "none" ? CommentsPanel.style.display = "flex" : CommentsPanel.style.display = "none";

});


//Commen()s min characters
let comment_product = document.getElementById('comment-product'); 
	
function MinCharactersComment() {

	if( comment_product.value.length > 0) { 
		return true; 	
	} else {	
		comment_product.placeholder = "Veuillez entrer au minimum 10 caractéres"; 	
		return false; 
	}
}	


//SLIDER
let slideIndex = 1;
showSlides(slideIndex);

// Next/previous controls
function plusSlides(n) {
  showSlides(slideIndex += n);
}


// Thumbnail image controls
function currentSlides() {
	let thumbnail = document.querySelectorAll(".thumbnail");
	
 	thumbnail.forEach(function(element, index, arr){
		arr[index].addEventListener('click', () => {
			 showSlides(slideIndex = index + 1);
		})
	})
} currentSlides();	


function showSlides(n) {
  let i;
  let slides = document.getElementsByClassName("mySlides");
  let thumbnail = document.getElementsByClassName("thumbnail");

  if (n > slides.length) {slideIndex = 1}
  if (n < 1) {slideIndex = slides.length}
  for (i = 0; i < slides.length; i++) {
    slides[i].style.display = "none";
  }
  for (i = 0; i < thumbnail.length; i++) {
    thumbnail[i].className = thumbnail[i].className.replace("active", "");
  }
  slides[slideIndex-1].style.display = "block";
  thumbnail[slideIndex-1].className += " active";
}
