let input_address_file = document.querySelectorAll(".container-input-add-address input");
let  address_input_txtOnly = document.querySelectorAll(".address-input-txtOnly");
let alerty_address = document.querySelector('.alerty-address');
let ZipCode_address = document.querySelector(".container-input-add-address input#zipCodeAdd");
let street_address = document.querySelector(".container-input-add-address input#addressAdd")

function keyupInputAdd_Adress() {
	input_address_file.forEach(function(element, index, arr){
		arr[index].addEventListener('keyup', () => {
			arr[index].classList.remove('error');
		} )

	})
} keyupInputAdd_Adress();


function verifZipCode_Address() {
	var regZipCode = new RegExp(/[0-9]{5}/, 'g');
	
	return !regZipCode.test(ZipCode_address.value) || Number.isNaN(Number(ZipCode_address.value)) ? 
	(ZipCode_address.focus(), ZipCode_address.className = "error", alerty_address.innerHTML="Code postal non valide", false) : (alerty_address.innerHTML="", true)
}

function verifTxtAddres_Street() {
		let minCaracters = /^[0-9a-zA-Z].{9,}$/;
		
		return !minCaracters.test(street_address.value)? 
		(street_address.className = "error", street_address.focus(), alerty_address.innerHTML="Caractères minimum requis", false) : 
		(alerty_address.innerHTML="", true);
}

function verifTxt_Address() {
	
	let error = 0;
	
	address_input_txtOnly.forEach(function(element, index, arr){
		let min = /^[a-zA-Z].{2,}$/;
		let regexNbr =/^[^0-9]+$/;	
		
		!regexNbr.test(arr[index].value) ? alerty_address.innerHTML="Vous ne pouvez pas entrer de chiffre" : "";
		 
		!min.test(arr[index].value) ? alerty_address.innerHTML="3 caractères minimum requis" : "";
		
		return !regexNbr.test(arr[index].value) || !min.test(arr[index].value)  ? 
		(arr[index].className = "error", arr[index].focus(), error ++) : error ;
		
	})

	return error >= 1 ? false : true;
}

function verifAddress() {
	let notVerified = 0;
	
	input_address_file.forEach(function(element, index, arr){	
		return arr[index].value == "" ? (arr[index].className = "error", arr[index].focus(), notVerified ++, false) : true
		
	})

	if (notVerified == 0) {
		alerty_modal_address.innerHTML="";
		if  (verifZipCode_Address() == false || verifTxt_Address()== false || verifTxtAddres_Street()== false ) {
			return false;
		}
		return true;
	}
	
	return notVerified >= 1 ? (alerty_address.innerHTML="Veuillez remplir tous les champs", false): "";
		
}