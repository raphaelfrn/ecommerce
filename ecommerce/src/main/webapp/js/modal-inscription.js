let modalInscription = document.querySelector(".background-modal-inscription");
let closeInscription = document.querySelector(".icon-close-inscription");
let BtnInscription = document.querySelector(".btn-modal-inscription");


BtnInscription.addEventListener("click", () => {
	
	modalConnexion.style.display = "none";
	modalInscription.style.display = "flex";

	
	closeInscription.addEventListener("click", () => {
		modalInscription.style.display = "none";
		
		
	});
});
