let slidesHome = document.getElementsByClassName("container-hero");
let container_icon = document.querySelector('.container-icon-slides-home');
let sound = document.getElementsByClassName("icon-sound");
let video = document.getElementsByClassName("video-hero");

let slideIndex = 1;
showSlides(slideIndex);

// Controle des btn retour/suivant
function plusSlides(n) {
  showSlides(slideIndex += n);
}


//gestion du slider et du son
function showSlides(n) {
  let i;
  if (n > slidesHome.length) {slideIndex = 1}
  if (n < 1) {slideIndex = slidesHome.length}
  for (i = 0; i < slidesHome.length; i++) {
    slidesHome[i].style.display = "none";
	video[i].muted = true;
  }
  slidesHome[slideIndex-1].style.display = "block";
  
  sound[slideIndex-1].addEventListener('click', () => {
	  video[slideIndex-1].muted = !video[slideIndex-1].muted;
	})
}


// Hover Arrow
container_icon.addEventListener("mouseover", () => { 
	container_icon.style.opacity = 1; 
});

container_icon.addEventListener("mouseout", () => { 
	container_icon.style.opacity = 0;
});
		

