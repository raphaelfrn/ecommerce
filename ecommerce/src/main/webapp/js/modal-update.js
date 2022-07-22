let modal = document.querySelector(".background-modal");
let close = document.querySelector(".icon-close");
let title = document.querySelector(".title-modal-update");
let containerInput = document.querySelector(".container-input-modal-update");
let fullname = document.querySelector(".update-fullname");
let mail = document.querySelector(".update-mail");
let phone = document.querySelector(".update-phone");
let pwd = document.querySelector(".update-pwd");

fullname.addEventListener("click", () => {
	modal.style.display = "flex";
	
	title.innerHTML="Modifier votre nom et prénom";
	let input_lastname = document.createElement('input');
	let input_firstname = document.createElement('input');
	
	input_lastname.id = 'newLastname';
	input_lastname.setAttribute('name','newLastname');
	input_lastname.setAttribute('type','text');
	input_lastname.setAttribute('placeholder','Nouveau Nom');
	
	input_firstname.id = 'newFirstname';
	input_firstname.setAttribute('name','newFirstname');
	input_firstname.setAttribute('type','text');
	input_firstname.setAttribute('placeholder','Nouveau Prénom');
	 
	containerInput.appendChild(input_lastname);
	containerInput.appendChild(input_firstname);
	
	close.addEventListener("click", () => {
		modal.style.display = "none";
		input_lastname.remove();
		input_firstname.remove();
	});
});

mail.addEventListener("click", () => {
	modal.style.display = "flex";
	
	title.innerHTML="Modifier votre adresse mail";
	let input_new_mail= document.createElement('input');
	let input_repeat_mail= document.createElement('input');

	input_new_mail.id = 'newMail';
	input_new_mail.setAttribute('name','newMail');
	input_new_mail.setAttribute('type','text');
	input_new_mail.setAttribute('placeholder','Nouveau Mail');
	
	input_repeat_mail.id = 'repeatMail';
	input_repeat_mail.setAttribute('name','repeatMail');
	input_repeat_mail.setAttribute('type','text');
	input_repeat_mail.setAttribute('placeholder','Répéter l’email');
	 
	containerInput.appendChild(input_new_mail);
	containerInput.appendChild(input_repeat_mail);
	
	close.addEventListener("click", () => {
		modal.style.display = "none";
		input_new_mail.remove();
		input_repeat_mail.remove();
	});
});

phone.addEventListener("click", () => {
	modal.style.display = "flex";
	
	title.innerHTML="Modifier votre numéro de téléphone";
	let input_new_phone = document.createElement('input');
	let input_repeat_phone = document.createElement('input');
	
	input_new_phone.id = 'newPhone';
	input_new_phone.setAttribute('name','newPhone');
	input_new_phone.setAttribute('type','text');
	input_new_phone.setAttribute('placeholder','Nouveau numéro');
	
	input_repeat_phone.id = 'repeatMail';
	input_repeat_phone.setAttribute('name','repeatMail');
	input_repeat_phone.setAttribute('type','text');
	input_repeat_phone.setAttribute('placeholder','Répéter votre numéro');
	 
	containerInput.appendChild(input_new_phone);
	containerInput.appendChild(input_repeat_phone);
	
	close.addEventListener("click", () => {
		modal.style.display = "none";
		input_new_phone.remove();
		input_repeat_phone.remove();
	});
});

pwd.addEventListener("click", () => {
	modal.style.display = "flex";
	
	title.innerHTML="Modifier votre mot de passe ";
	let input_last_pwd = document.createElement('input');
	let input_new_pwd = document.createElement('input');
	let input_repeat_pwd = document.createElement('input');
	
	input_last_pwd.id = 'lastPwd';
	input_last_pwd.setAttribute('name','lastPwd');
	input_last_pwd.setAttribute('type','text');
	input_last_pwd.setAttribute('placeholder','Mot de passe actuel');
	
	input_new_pwd.id = 'newPwd';
	input_new_pwd.setAttribute('name','newPwd');
	input_new_pwd.setAttribute('type','text');
	input_new_pwd.setAttribute('placeholder','Nouveau mot de passe ');
	
	input_repeat_pwd.id = 'repeatPwd';
	input_repeat_pwd.setAttribute('name','repeatPwd');
	input_repeat_pwd.setAttribute('type','text');
	input_repeat_pwd.setAttribute('placeholder','Répéter votre mot de passe ');

	 
	containerInput.appendChild(input_last_pwd);
	containerInput.appendChild(input_new_pwd);
	containerInput.appendChild(input_repeat_pwd);
	
	close.addEventListener("click", () => {
		modal.style.display = "none";
		input_last_pwd.remove();
		input_new_pwd.remove();
		input_repeat_pwd.remove();
	});
});

