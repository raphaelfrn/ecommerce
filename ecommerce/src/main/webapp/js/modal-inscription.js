let modalInscription = document.querySelector(".background-modal-inscription");
let closeInscription = document.querySelector(".icon-close-inscription");
let BtnInscription = document.querySelector(".btn-modal-inscription");

let timeout_register = document.querySelector(".confirm-register");

let alerty = document.querySelector('.alerty');
let inputs_register = document.querySelectorAll(".container-modal-inscription-input input");
let mail = document.querySelector(".container-modal-inscription-input input#email");
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
	
	if (mail.value.match(regexMail)) {
		alerty.innerHTML="";
		return true
				
	} else {
		mail.className = "error";
		alerty.innerHTML="L'email n'est pas valide"
		return false
	}
}

function verifPhone() {
	let regexPhone = /^(01|02|03|04|05|06|07|08|09)[0-9]{8}$/;
	
	if (!regexPhone.test(tel.value) || Number.isNaN(Number(tel.value))) {
		tel.className = "error";
		alerty.innerHTML="Numéro de télèphone non valide"
		return false
	} else {
		alerty.innerHTML="";
 		return true
	}
}

function verifpwd() {
	if (password.value != passwordConfirm.value) {
		password.className = "error";
		passwordConfirm.className = "error";
		alerty.innerHTML="Veuillez entrer des mots de passe identique"
		return false
	} else {
		password.className = "removeError";
		passwordConfirm.className = "removeError";
		alerty.innerHTML="";
 		return true
	}
}

function verif() {
	let notVerified = 0;
	
	inputs_register.forEach(function(element, index, arr){
		if (arr[index].value == "") {
				arr[index].className = "error";
				notVerified ++;
		} else {
			arr[index].focus();
		}
	})

	if (notVerified >= 1) {
		alerty.innerHTML="Veuillez remplir tous les champs"
		return false;
	} else {
		alerty.innerHTML="";
	}
			
	if (notVerified == 0) {
		if  (verifPhone() == false || verifpwd() == false || verifMail() == false) {
			return false;
		}
		return true;
	}
}
