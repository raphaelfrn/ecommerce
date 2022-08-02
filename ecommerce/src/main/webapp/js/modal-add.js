let modal = document.querySelector(".background-modal");
let close_add = document.querySelector(".icon-close-add");
let add_address = document.querySelector(".title-add-address");
let headerModalAdd = document.querySelector(".container-header");

let inputs_modal_address = document.querySelectorAll(".container-input-modal-add input");
let  address_input_txt_only = document.querySelectorAll(".address-input-txt-only");
let alerty_modal_address = document.querySelector('.alerty-modal-address');

let ZipCode_modal_address = document.querySelector(".container-input-modal-add input#modalAdressZipCode");
let street_modal_address = document.querySelector(".container-input-modal-add input#modalAddressStreet")

add_address.addEventListener("click", () => {
	modal.style.display = "flex";
	headerModalAdd.style.display = "none";
	
	close_add.addEventListener("click", () => {
		modal.style.display = "none";
		headerModalAdd.style.display = "block";
	});
});

function keyupInputAddAdress() {
	inputs_modal_address.forEach(function(element, index, arr){
		arr[index].addEventListener('keyup', () => {
			arr[index].classList.remove('error');
		} )

	})
} keyupInputAddAdress();


function verifZipCodeModalAddress() {
	var regZipCode = new RegExp(/[0-9]{5}/, 'g');
	
	return !regZipCode.test(ZipCode_modal_address.value) || Number.isNaN(Number(ZipCode_modal_address.value)) ? 
	(ZipCode_modal_address.focus(), ZipCode_modal_address.className = "error", alerty_modal_address.innerHTML="Code postal non valide", false) : (alerty_modal_address.innerHTML="", true)
}

function verifTxtModalAddresstreet() {
		let minCaracters = /^[0-9a-zA-Z].{9,}$/;
		
		return !minCaracters.test(street_modal_address.value)? 
		(street_modal_address.className = "error", street_modal_address.focus(), alerty_modal_address.innerHTML="Caractères minimum requis", false) : 
		(alerty_modal_address.innerHTML="", true);
}

function verifTxtModalAddress() {
	
	let error = 0;
	
	address_input_txt_only.forEach(function(element, index, arr){
		let min = /^[a-zA-Z].{2,}$/;
		let regexNbr =/^[^0-9]+$/;	
		
		!regexNbr.test(arr[index].value) ? alerty_modal_address.innerHTML="Vous ne pouvez pas entrer de chiffre" : "";
		 
		!min.test(arr[index].value) ? alerty_modal_address.innerHTML="3 caractères minimum requis" : "";
		
		return !regexNbr.test(arr[index].value) || !min.test(arr[index].value)  ? 
		(arr[index].className = "error", arr[index].focus(), error ++) : error ;
		
	})

	return error >= 1 ? false : true;
}

function verifAddressModal() {
	let notVerified = 0;
	
	inputs_modal_address.forEach(function(element, index, arr){	
		return arr[index].value == "" ? (arr[index].className = "error", arr[index].focus(), notVerified ++, false) : true
		
	})

	if (notVerified == 0) {
		alerty_modal_address.innerHTML="";
		if  (verifZipCodeModalAddress() == false || verifTxtModalAddress()== false || verifTxtModalAddresstreet()== false ) {
			return false;
		}
		return true;
	}
	
	return notVerified >= 1 ? (alerty_modal_address.innerHTML="Veuillez remplir tous les champs", false): "";
		
}