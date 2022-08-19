//Timeout alert msg

var timeout = setTimeout(() => {
	let alertyValidatePwd = document.querySelectorAll(".alertValidatePwd");
	let confirmConnexion = document.querySelector(".confirm-connexion");
	let alert_msg_add = document.querySelectorAll(".alert-msg-add");
	
	alertyValidatePwd.forEach(function(element, index, arr){	
		if (arr[index] != null) {
			arr[index].style.display = "none";
		}
	})
	
	if (confirmConnexion != null) {
		confirmConnexion.style.display = "none";
	}
	
	alert_msg_add.forEach(function(element, index, arr){	
		if (arr[index] != null) {
			arr[index].style.display = "none";
		}
	})

}, 6000) 

function myStopFunction() {
  clearTimeout(timeout);
} 