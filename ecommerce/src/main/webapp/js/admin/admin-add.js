let isClikedCat = false;

function addCat() {
	let admin_display_add_cat = document.querySelector(".admin-icon-display-add-cat"); 
	let admin_form_add_cat = document.querySelector(".admin-form-add-cat");
	let admin_btn_add_cat = document.querySelector(".admin-btn-add-cat");
	
		admin_display_add_cat.addEventListener('click', () => {
	
		admin_form_add_cat.style.display = "flex";
		admin_display_add_cat.style.display = "none"; 
		isClikedCat = true;
		 	 
		 if (isClikedCat = true) {
			let container_add_cat = document.querySelector(".container-add-categories");
			
			container_add_cat.addEventListener('mouseover', () => {
				admin_form_add_cat.style.display = "flex";
				admin_display_add_cat.style.display = "none"; 
			
			})
			
			container_add_cat.addEventListener('mouseout', () => {
				admin_form_add_cat.style.display = "none";
				admin_display_add_cat.style.display = "block"; 
			})
		}
	
	})
	
	admin_btn_add_cat.addEventListener('click', () => {
	
		admin_form_add_cat.style.display = "none";
		admin_display_add_cat.style.display = "block"; 
	})
} addCat();



let isClikedSubcat = false;

function addSubCat() {
		
	let admin_form_add_subcat = document.querySelector(".admin-form-add-subcategories");
	let admin_display_add_subcat = document.querySelector(".admin-icon-display-add-subcat"); 
	let admin_btn_add_subcat = document.querySelector(".admin-btn-add-subcat");

	
		admin_display_add_subcat.addEventListener('click', () => {
	
		admin_form_add_subcat.style.display = "flex";
		admin_display_add_subcat.style.display = "none"; 
		isClikedSubcat = true;
		 	 
		 if (isClikedSubcat = true) {
			let container_add_subcat = document.querySelector(".container-add-subcategories");
			
			container_add_subcat.addEventListener('mouseover', () => {
				admin_form_add_subcat.style.display = "flex";
				admin_display_add_subcat.style.display = "none"; 
			
			})
			
			container_add_subcat.addEventListener('mouseout', () => {
				admin_form_add_subcat.style.display = "none";
				admin_display_add_subcat.style.display = "block"; 
			})
		}
	
	})
	
	admin_btn_add_subcat.addEventListener('click', () => {
	
		admin_form_add_subcat.style.display = "none";
		admin_display_add_subcat.style.display = "block"; 
	})
} addSubCat();



let isClikedProd = false;

function addProd() {
		
	let admin_form_add_prod = document.querySelector(".admin-form-add-products");
	let admin_display_add_prod = document.querySelector(".admin-icon-display-add-prod"); 
	let admin_btn_add_prod = document.querySelector(".admin-btn-add-prod");

	
		admin_display_add_prod.addEventListener('click', () => {
	
		admin_form_add_prod.style.display = "flex";
		admin_display_add_prod.style.display = "none"; 
		isClikedProd = true;
		 	 
		 if (isClikedProd = true) {
			let container_add_prod = document.querySelector(".container-add-products");
			
			container_add_prod.addEventListener('mouseover', () => {
				admin_form_add_prod.style.display = "flex";
				admin_display_add_prod.style.display = "none"; 
			
			})
			
			container_add_prod.addEventListener('mouseout', () => {
				admin_form_add_prod.style.display = "none";
				admin_display_add_prod.style.display = "block"; 
			})
		}
	
	})
	
	admin_btn_add_prod.addEventListener('click', () => {
	
		admin_form_add_prod.style.display = "none";
		admin_display_add_prod.style.display = "block"; 
	})
} addProd();

