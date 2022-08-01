let modal = document.querySelector(".background-modal");
let close_add = document.querySelector(".icon-close-add");
let add_address = document.querySelector(".title-add-address");
let headerModalAdd = document.querySelector(".container-header");

let inputsAddAddress = document.querySelectorAll(".container-input-modal-add input");

console.log(inputsAddAddress)

add_address.addEventListener("click", () => {
	modal.style.display = "flex";
	headerModalAdd.style.display = "none";
	
	close_add.addEventListener("click", () => {
		modal.style.display = "none";
		headerModalAdd.style.display = "block";
	});
});

function keyupInputAddAdress() {
	inputsAddAddress.forEach(function(element, index, arr){
		arr[index].addEventListener('keyup', () => {
			arr[index].classList.remove('error');
		} )

	})
} keyupInputAddAdress();