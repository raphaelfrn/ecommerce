let modal = document.querySelector(".background-modal");
let close_add = document.querySelector(".icon-close-add");
let title = document.querySelector(".title-modal-add");
let containerInput = document.querySelector(".container-input-modal-add");

let add_address = document.querySelector(".title-add-address");


add_address.addEventListener("click", () => {
	modal.style.display = "flex";
	
	title.innerHTML="Ajouter une nouvelle adresse de livraison";
	let input_address= document.createElement('input');
	let input_city = document.createElement('input');
	let input_zip_code = document.createElement('input');
	let input_country = document.createElement('input');
	
	input_address.id = 'addAddress';
	input_address.setAttribute('name','addAddress');
	input_address.setAttribute('type','text');
	input_address.setAttribute('placeholder','Adresse');
	
	input_city.id = 'addCity';
	input_city.setAttribute('name','addCity');
	input_city.setAttribute('type','text');
	input_city.setAttribute('placeholder','Ville');
	
	input_zip_code.id = 'addZipcode';
	input_zip_code.setAttribute('name','addZipcode');
	input_zip_code.setAttribute('type','text');
	input_zip_code.setAttribute('placeholder','Code Postal');
	
	input_country.id = 'addCountry';
	input_country.setAttribute('name','addCountry');
	input_country.setAttribute('type','text');
	input_country.setAttribute('placeholder','Pays');
	 
	containerInput.appendChild(input_address);
	containerInput.appendChild(input_city);
	containerInput.appendChild(input_zip_code);
	containerInput.appendChild(input_country);
	
	close_add.addEventListener("click", () => {
		modal.style.display = "none";
		input_address.remove();
		input_city.remove();
		input_zip_code.remove();
		input_country.remove();
	});
});