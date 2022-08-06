let alertValidatePwd = document.querySelectorAll(".alertValidatePwd");
let confirmConnexion = document.querySelector(".confirm-connexion");

//Timeout alert msg
var myTimeout = setTimeout(() => {
	alertValidatePwd.forEach(function(element, index, arr){	
		if (arr[index] != null) {
			arr[index].style.display = "none";
		}
	})
	
	if (confirmConnexion != null) {
		confirmConnexion.style.display = "none";
	}

}, 6000) 

function myStopFunction() {
  clearTimeout(myTimeout);
} 