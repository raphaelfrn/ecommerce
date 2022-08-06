let alertValidatePwd = document.querySelectorAll(".alertValidatePwd");

//Timeout alert msg
var myTimeout = setTimeout(() => {
	alertValidatePwd.forEach(function(element, index, arr){	
		if (arr[index] != null) {
			arr[index].style.display = "none";
		}
	})
}, 6000) 

function myStopFunction() {
  clearTimeout(myTimeout);
} 