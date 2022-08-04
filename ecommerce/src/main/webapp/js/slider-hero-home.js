let slidesHome = document.getElementsByClassName("container-hero");
let container_icon = document.querySelector('.container-icon-slides-home');

let slideIndex = 1;
showSlides(slideIndex);

// Controle des btn retour/suivant
function plusSlides(n) {
  showSlides(slideIndex += n);
}

//gestion du slider
function showSlides(n) {
  let i;
  if (n > slidesHome.length) {slideIndex = 1}
  if (n < 1) {slideIndex = slidesHome.length}
  for (i = 0; i < slidesHome.length; i++) {
    slidesHome[i].style.display = "none";
  }
  slidesHome[slideIndex-1].style.display = "block";
}

//let container_slides_home = document.querySelectorAll(".container-hero");
//	console.log(container_slides_home)
//	container_slides_home.forEach(function(element, index, arr){
//			arr[index].addEventListener("mouseover", () => { 
//				console.log(arr[index])
//				console.log(container_icon)
//		container_icon.style.display = "flex"
//			console.log("ds le flex")
//		});
//		
//		console.log("ok")
//});
