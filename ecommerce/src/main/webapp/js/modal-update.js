let modal = document.querySelector(".background-modal");
let title = document.querySelector(".title-modal-update");
let containerInput = document.querySelector(".container-input-modal-update");
let fullname = document.querySelector(".update-fullname");
let mail_Update = document.querySelector(".update-mail");
let phone = document.querySelector(".update-phone");
let pwd = document.querySelector(".update-pwd");
let headerModalUpdate = document.querySelector(".container-header");
let form_update_user = document.querySelector(".verif-update-user");
let alerty_update_user = document.querySelector(".alerty-update-user");


fullname.addEventListener("click", () => {
	modal.style.display = "flex";
	headerModalUpdate.style.display = "none";

	let input_lastname = document.createElement('input');
	input_lastname.id = 'newLastname';
	input_lastname.setAttribute('name','newLastname');
	input_lastname.setAttribute('type','text');
	input_lastname.setAttribute('placeholder','Nouveau Nom');
	
	let input_firstname = document.createElement('input');
	input_firstname.id = 'newFirstname';
	input_firstname.setAttribute('name','newFirstname');
	input_firstname.setAttribute('type','text');
	input_firstname.setAttribute('placeholder','Nouveau Prénom');
	 
	containerInput.appendChild(input_lastname);
	containerInput.appendChild(input_firstname);
	
	
	// Verif Name
	let arrayInputsupdate= [];
	arrayInputsupdate.push(input_lastname);
	arrayInputsupdate.push(input_firstname);

	function keyupInputCo() {
		arrayInputsupdate.forEach(function(element, index, arr){
			arr[index].addEventListener('keyup', () => {
				arr[index].classList.remove('error');
			} )
		})
	} keyupInputCo();
		
	form_update_user.addEventListener('submit',  (event) => {
		let error = 0;
		arrayInputsupdate.forEach(function(element, index, arr){
			let min = /^[a-zA-Z].{2,}$/;
			let regexNbr =/^[^0-9]+$/;	
			
			!regexNbr.test(arr[index].value) ? alerty_update_user.innerHTML="Vous ne pouvez pas entrer de chiffre" : ""; 
			!min.test(arr[index].value) ? alerty_update_user.innerHTML="3 caractères minimum requis" : "";
			
			return !regexNbr.test(arr[index].value) || !min.test(arr[index].value)  ? 
			(arr[index].className = "error", arr[index].focus(), error ++) : error ;
		})
	
		return error >= 1 ? (event.preventDefault(), false) : true;
	}, false)
				
});
 
  	
mail_Update.addEventListener("click", () => {
	modal.style.display = "flex";
	headerModalUpdate.style.display = "none";
	
	title.innerHTML="Modifier votre adresse mail";
	let input_new_mail= document.createElement('input');
	let input_repeat_email= document.createElement('input');

	input_new_mail.id = 'newMail';
	input_new_mail.setAttribute('name','newMail');
	input_new_mail.setAttribute('type','text');
	input_new_mail.setAttribute('placeholder','Nouveau Mail');
	
	input_repeat_email.id = 'repeatEMail';
	input_repeat_email.setAttribute('name','repeatEMail');
	input_repeat_email.setAttribute('type','text');
	input_repeat_email.setAttribute('placeholder','Répéter l’email');
	 
	containerInput.appendChild(input_new_mail);
	containerInput.appendChild(input_repeat_email);
	
	
	// Verif Mail
	let arrayInputsupdate= [];
	arrayInputsupdate.push(input_new_mail);
	arrayInputsupdate.push(input_repeat_email);

	function keyupInputCo() {
		arrayInputsupdate.forEach(function(element, index, arr){
			arr[index].addEventListener('keyup', () => {
				arr[index].classList.remove('error');
			} )
		})
	} keyupInputCo();
		
	form_update_user.addEventListener('submit',  (event) => {
		let error = 0;
		
		arrayInputsupdate.forEach(function(element, index, arr){
			let regexMail = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
			
			!arr[index].value.match(regexMail) ?  alerty_update_user.innerHTML="L'email n'est pas valide" : true;
			input_new_mail.value != input_repeat_email.value ? alerty_update_user.innerHTML="Les emails ne sont pas identique" : true;
		
			return !arr[index].value.match(regexMail) || input_new_mail.value  != input_repeat_email.value ? 
			(arr[index].focus(), arr[index].className = "error",  error ++, false) :
			(error, true ) 		
		})
	
		return error >= 1 ? (event.preventDefault(), false) : true;
	}, false)
});

	
phone.addEventListener("click", () => {
	modal.style.display = "flex";
	headerModalUpdate.style.display = "none";
	
	title.innerHTML="Modifier votre numéro de téléphone";
	let input_new_phone = document.createElement('input');
	let input_repeat_phone = document.createElement('input');
	
	input_new_phone.id = 'newPhone';
	input_new_phone.setAttribute('name','newPhone');
	input_new_phone.setAttribute('type','text');
	input_new_phone.setAttribute('placeholder','Nouveau numéro');
	
	input_repeat_phone.id = 'repeatPhone';
	input_repeat_phone.setAttribute('name','repeatPhone');
	input_repeat_phone.setAttribute('type','text');
	input_repeat_phone.setAttribute('placeholder','Répéter votre numéro');
	 
	containerInput.appendChild(input_new_phone);
	containerInput.appendChild(input_repeat_phone);
	
	
	// Verif Phone
	let arrayInputsupdate= [];
	arrayInputsupdate.push(input_new_phone);
	arrayInputsupdate.push(input_repeat_phone);

	function keyupInputCo() {
		arrayInputsupdate.forEach(function(element, index, arr){
			arr[index].addEventListener('keyup', () => {
				arr[index].classList.remove('error');
			} )
		})
	} keyupInputCo();
		
	form_update_user.addEventListener('submit',  (event) => {
		let error = 0;
		
		arrayInputsupdate.forEach(function(element, index, arr){
			let regexPhone = /^(01|02|03|04|05|06|07|08|09)[0-9]{8}$/;
			
			!regexPhone.test(arr[index].value) ||  Number.isNaN(Number(arr[index].value)) ?  alerty_update_user.innerHTML="Le numéro de téléphone n'est pas valide" : true;
			input_new_phone.value != input_repeat_phone.value ? alerty_update_user.innerHTML="Les numéros de téléphone saisie ne sont pas identique" : true;
		
			return !regexPhone.test(arr[index].value) ||  Number.isNaN(Number(arr[index].value)) || input_new_phone.value  != input_repeat_phone.value ? 
			(arr[index].focus(), arr[index].className = "error",  error ++, false) :
			(error, true ) 	
		})
	
		return error >= 1 ? (event.preventDefault(), false) : true;
	}, false)
});


pwd.addEventListener("click", () => {
	modal.style.display = "flex";
	headerModalUpdate.style.display = "none";
	
	title.innerHTML="Modifier votre mot de passe ";
	let input_last_pwd = document.createElement('input');
	let input_new_pwd = document.createElement('input');
	let input_repeat_pwd = document.createElement('input');
	
	input_last_pwd.id = 'lastPwd';
	input_last_pwd.setAttribute('name','lastPwd');
	input_last_pwd.setAttribute('type','password');
	input_last_pwd.setAttribute('placeholder','Mot de passe actuel');
	
	input_new_pwd.id = 'newPwd';
	input_new_pwd.setAttribute('name','newPwd');
	input_new_pwd.setAttribute('type','password');
	input_new_pwd.setAttribute('placeholder','Nouveau mot de passe ');
	
	input_repeat_pwd.id = 'repeatPwd';
	input_repeat_pwd.setAttribute('name','repeatPwd');
	input_repeat_pwd.setAttribute('type','password');
	input_repeat_pwd.setAttribute('placeholder','Répéter votre mot de passe ');

	 
	containerInput.appendChild(input_last_pwd);
	containerInput.appendChild(input_new_pwd);
	containerInput.appendChild(input_repeat_pwd);

	
	//Verif Password
	
	let arrayInputsupdate= [];
	arrayInputsupdate.push(input_last_pwd);
	arrayInputsupdate.push(input_new_pwd);
	arrayInputsupdate.push(input_repeat_pwd);

	function keyupInputCo() {
		arrayInputsupdate.forEach(function(element, index, arr){
			arr[index].addEventListener('keyup', () => {
				arr[index].classList.remove('error');
			} )
		})
	} keyupInputCo();
		
	form_update_user.addEventListener('submit',  (event) => {
		let error = 0;
		
		arrayInputsupdate.forEach(function(element, index, arr){
			return input_new_pwd.value != input_repeat_pwd.value  ? 
			(arr[index].focus(), arr[index].className = "error", alerty_update_user.innerHTML="Les mots de passe ne sont pas identique",  error ++, false) :
			(error, true ) 	
		})
	
		return error >= 1 ? (event.preventDefault(), false) : true;
	}, false)
});

