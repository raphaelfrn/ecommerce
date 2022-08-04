let modalConnexion = document.querySelector(".background-modal-connexion");
let close = document.querySelector(".icon-close");
let containerInput1 = document.querySelector(".container-input-modal-connexion1");
let containerInput2 = document.querySelector(".container-input-modal-connexion2");
let IconConnexion = document.querySelector(".icon-connexion");
let InscriptionBtn = document.querySelector(".btn-modal-inscription")

let input_email = document.createElement('input');
let input_password = document.createElement('input');
	

// Creation des inputs
if (IconConnexion != null) {
	IconConnexion.addEventListener("click", () => {
	
		modalConnexion.style.display = "flex";	
		
		let icon_email = document.createElement("img");
		let icon_pwd = document.createElement("img");
		icon_pwd.className='iconPwd';
		
		input_email.id = 'emailCo';
		input_email.setAttribute('name','emailCo');
		input_email.setAttribute('type','text');
		input_email.setAttribute('placeholder','Email');
		icon_email.src = "assets/icon/mail.svg";
		
		input_password.id = 'passwordCo';
		input_password.setAttribute('name','passwordCo');
		input_password.setAttribute('type','password');
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
		
		
		InscriptionBtn.addEventListener("click", () => {
			input_email.remove();
			input_password.remove();
			icon_email.remove();
			icon_pwd.remove();	
			
			modalConnexion.style.display = "none";
			modalInscription.style.display = "flex";
	
			closeInscription.addEventListener("click", () => {
			modalInscription.style.display = "none";
			});
		})
	});
}

// Verification formulaire

let alertyCo = document.querySelector('.alerty-co');
let arrayInputsCo = [];

arrayInputsCo.push(input_password);
arrayInputsCo.push(input_email);

function keyupInputCo() {
	arrayInputsCo.forEach(function(element, index, arr){
		arr[index].addEventListener('keyup', () => {
			arr[index].classList.remove('errorCo');
		} )
	})
} keyupInputCo();


function verifCo() {
	let notVerified = 0;
	
		arrayInputsCo.forEach(function(element, index, arr){
		
		arr[index].value == "" ? 
				(arr[index].className = "errorCo", 
				alertyCo.innerHTML = "Veuillez remplier tous les champs",
				notVerified ++) : alertyCo.innerHTML = "", arr[index].focus();	
			
	})
	
	return notVerified >= 1 ? (alertyCo.innerHTML="Veuillez remplir tous les champs", false) : alertyCo.innerHTML = "" ; 
}
