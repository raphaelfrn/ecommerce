let admin_display_add = document.querySelector(".admin-icon-display-add"); 
let admin_form_add_cat = document.querySelector(".admin-form-add-cat");
let admin_btn_add = document.querySelector(".admin-btn-add");
let admin_input_add_cat = document.querySelectorAll(".admin-form-add-cat input");

admin_form_add_cat.addEventListener('submit', function() {
	
	admin_input_add_cat.forEach(function(element, index, arr){
		arr[index].value;
	})
})

admin_display_add.addEventListener('click', () => {
	admin_form_add_cat.style.display = "flex";
	admin_display_add.style.display = "none"; 
})

let isCliked = false;
admin_btn_add.addEventListener('click', () => {
	isCliked = true;
	admin_form_add_cat.style.display = "none";
	admin_display_add.style.display = "block"; 
})


