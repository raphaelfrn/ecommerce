let modalConnexion = document.querySelector(".background-modal-connexion");
let close = document.querySelector(".icon-close");
let containerInput1 = document.querySelector(".container-input-modal-connexion1");
let containerInput2 = document.querySelector(".container-input-modal-connexion2");
let IconConnexion = document.querySelector(".icon-connexion");


IconConnexion.addEventListener("click", () => {
	modalConnexion.style.display = "flex";
	
	let input_email = document.createElement('input');
	let input_password = document.createElement('input');
	
	let icon_email = document.createElement("img");
	icon_email.id = 'icon-co';
	let icon_pwd = document.createElement("img");
	icon_email.id = 'icon-con';
	
	input_email.id = 'newEmail';
	input_email.setAttribute('name','newEmail');
	input_email.setAttribute('type','text');
	input_email.setAttribute('placeholder','Email');
	icon_email.src = "assets/icon/mail.svg";
	
	input_password.id = 'newPassword';
	input_password.setAttribute('name','newPassword');
	input_password.setAttribute('type','text');
	input_password.setAttribute('placeholder','Mot de passe');
	icon_pwd.src = "assets/icon/pwd.svg";
	 
	containerInput1.appendChild(icon_email); 
	containerInput1.appendChild(input_email);
	
	containerInput2.appendChild(icon_pwd);
	containerInput2.appendChild(input_password);

	
	close.addEventListener("click", () => {
		modalConnexion.style.display = "none";
		input_email.remove();
		input_password.remove();
		icon_email.remove();
		icon_pwd.remove();
	});
});
