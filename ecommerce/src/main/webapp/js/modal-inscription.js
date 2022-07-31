let modalInscription = document.querySelector(".background-modal-inscription");
let closeInscription = document.querySelector(".icon-close-inscription");
let BtnInscription = document.querySelector(".btn-modal-inscription");

let timeout_register = document.querySelector(".confirm-register");

let alerty = document.querySelector('.alerty');
let inputs_register = document.querySelectorAll(".container-modal-inscription-input input");
let mail = document.querySelector(".container-modal-inscription-input input#email");
let zipCode = document.querySelector(".container-modal-inscription-input input#zipCode");
let tel = document.querySelector(".container-modal-inscription-input input#phone");
let password = document.querySelector(".container-modal-inscription-input input#password");
let passwordConfirm = document.querySelector(".container-modal-inscription-input input#passwordConfirm");

//Display Inscription
BtnInscription.addEventListener("click", () => {
	
	modalConnexion.style.display = "none";
	modalInscription.style.display = "flex";

	closeInscription.addEventListener("click", () => {
		modalInscription.style.display = "none";
	});
});

//Timeout Confirmation Inscription
var myTimeout = setTimeout(() => {
	if (timeout_register != null) {
		timeout_register.style.display = "none";
	}
}, 6000) 

function myStopFunction() {
  clearTimeout(myTimeout);
} 

//Verification du formulaire

function keyupInput() {
	inputs_register.forEach(function(element, index, arr){
		arr[index].addEventListener('keyup', () => {
			arr[index].classList.remove('error');
		} )

	})
} keyupInput();


function verifMail() {
	let regexMail = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
	
	return mail.value.match(regexMail) ? 
	(alerty.innerHTML="",  true ) : (mail.focus(), mail.className = "error", alerty.innerHTML="L'email n'est pas valide", false)
}

function verifZipCode() {
	var regZipCode = new RegExp(/[0-9]{5}/, 'g');
	
	return !regZipCode.test(zipCode.value) || Number.isNaN(Number(zipCode.value)) ? 
	(zipCode.focus(), zipCode.className = "error", alerty.innerHTML="Code postal non valide", false) : (alerty.innerHTML="", true)
}


function verifPhone() {
	let regexPhone = /^(01|02|03|04|05|06|07|08|09)[0-9]{8}$/;
	
	return !regexPhone.test(tel.value) || Number.isNaN(Number(tel.value)) ? 
	(tel.focus(), tel.className = "error", alerty.innerHTML="Numéro de télèphone non valide", false) : (alerty.innerHTML="", true)
}

function verifpwd() {
	
	return password.value != passwordConfirm.value ?
	(password.focus(), password.className = "error", passwordConfirm.className = "error", alerty.innerHTML="Veuillez entrer des mots de passe identique", false) :
	(password.className = "removeError", passwordConfirm.className = "removeError", alerty.innerHTML="", true)
}

function verif() {
	let notVerified = 0;
	
	inputs_register.forEach(function(element, index, arr){	
		return arr[index].value == "" ? (arr[index].className = "error", arr[index].focus(), notVerified ++, false) : true
	})

		
	if (notVerified == 0) {
		if  (verifZipCode() == false || verifPhone() == false || verifpwd() == false || verifMail() == false) {
			return false;
		}
		return true;
	}
	
	return notVerified >= 1 ? (alerty.innerHTML="Veuillez remplir tous les champs", false) : alerty.innerHTML="";
}

