let btnCategorie = document.querySelectorAll(".btn-categorie-show");
let containerProduits  = document.querySelector(".container-produits ");
let containerCategories = document.querySelector(".container-categories");
let back = document.querySelector(".icon-back");

btnCategorie.forEach(element => 
	element.addEventListener("click", () => {
		back.style.display = "flex";
		containerProduits.style.display = "flex";
		containerCategories.style.display = "none";
	})
);

back.addEventListener("click", () => {
	containerProduits.style.display = "none";
	containerCategories.style.display = "flex";
	back.style.display = "none";
})