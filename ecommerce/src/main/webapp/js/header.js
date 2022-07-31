let account_icon_user = document.querySelectorAll(".header-account-click");
let cobtainer_acount_choice = document.querySelector(".container-header-account-choice");
let icon_close_user_choice = document.querySelector(".icon-close-user-choice")

account_icon_user.forEach(function(element, index, arr){
	
	arr[index].addEventListener("click", () => {

		cobtainer_acount_choice.style.display = "block";
	
		icon_close_user_choice.addEventListener("click", () => {
			cobtainer_acount_choice.style.display = "none";
		});
	});
})