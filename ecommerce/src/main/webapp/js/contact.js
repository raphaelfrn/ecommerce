let sujetContact = document.querySelector(".contact-sujet");
let msgContact = document.querySelector(".contact-msg");
let alerty_contact = document.querySelector(".alerty-contact");
let alertTimeContact = document.querySelectorAll(".alertTimeContact");

// Verif formulaire
let inputsContact = [];
inputsContact.push(sujetContact)
inputsContact.push(msgContact)

function verifContact() {
	notVerified = 0;
	
	inputsContact.forEach(function(element, index, arr){	
		return arr[index].value == "" ? ( arr[index].focus(), notVerified ++, false) : true
	})

	if (notVerified >= 1 ) {
		alerty_contact.innerHTML="Veuillez remplir tous les champs";
		return false;
	} else {
		alerty.innerHTML="";
		return true;
	}
}

//Timeout alert msg
var myTimeout = setTimeout(() => {
	alertTimeContact.forEach(function(element, index, arr){	
		if (arr[index] != null) {
		arr[index].style.display = "none";
		}
	})
}, 6000) 

function myStopFunction() {
  clearTimeout(myTimeout);
} 