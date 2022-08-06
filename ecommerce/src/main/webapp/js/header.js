let account_icon_user = document.querySelectorAll(".header-account-click");
let container_acount_choice = document.querySelector(".container-header-account-choice");
let icon_close_user_choice = document.querySelector(".icon-close-user-choice");

account_icon_user.forEach(function(element, index, arr){
	
	arr[index].addEventListener("click", () => {

		container_acount_choice.style.display = "block";
	
		icon_close_user_choice.addEventListener("click", () => {
			cobtainer_acount_choice.style.display = "none";
		});
	});
})

if (container_acount_choice != null) {
	
	container_acount_choice.addEventListener("mouseover", () => {
		container_acount_choice.style.display = "block";
	});

	container_acount_choice.addEventListener("mouseout", () => {
		container_acount_choice.style.display = "none";
	});	
}


