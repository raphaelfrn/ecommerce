let modalConnexion = document.querySelector(".background-modal");
let closeConnexion = document.querySelector(".icon-close");
let containerInputConnexion = document.querySelector(".container-input-modal-connexion");
let connexion = document.querySelector(".connexion-click");


connexion.addEventListener("click", () => {
	modalConnexion.style.display = "flex";
	
	let input_email = document.createElement('input');
	let input_password = document.createElement('input');
	
	input_email.id = 'newEmail';
	input_email.setAttribute('name','newEmail');
	input_email.setAttribute('type','text');
	input_email.setAttribute('placeholder','Email');
	
	input_password.id = 'newPassword';
	input_password.setAttribute('name','newPassword');
	input_password.setAttribute('type','text');
	input_password.setAttribute('placeholder','Mot de passe');
	 
	containerInputConnexion.appendChild(input_email);
	containerInputConnexion.appendChild(input_password);
	
	closeConnexion.addEventListener("click", () => {
		modalConnexion.style.display = "none";
		input_email.remove();
		input_password.remove();
	});
});
