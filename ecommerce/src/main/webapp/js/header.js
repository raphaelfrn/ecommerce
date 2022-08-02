let account_icon_user = document.querySelectorAll(".header-account-click");
let cobtainer_acount_choice = document.querySelector(".container-header-account-choice");
let icon_close_user_choice = document.querySelector(".icon-close-user-choice");


let search = document.querySelector(".form-search");
let container_search = document.querySelector(".container-header-search");
let icon_close_search = document.querySelector(".icon-close-search");
let input_search = document.querySelector(".input_search");

account_icon_user.forEach(function(element, index, arr){
	
	arr[index].addEventListener("click", () => {

		cobtainer_acount_choice.style.display = "block";
	
		icon_close_user_choice.addEventListener("click", () => {
			cobtainer_acount_choice.style.display = "none";
		});
	});
})

input_search.addEventListener("keyup", (event) => {
	input_search.value
	
	}
);


function search(){
	
	
	container_search.style.display="block";
	
	icon_close_search.addEventListener("click", () => {
			
			container_search.style.display = "none";
		});
		
}



