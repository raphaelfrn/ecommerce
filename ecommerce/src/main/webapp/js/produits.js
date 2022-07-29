let btnCategorie = document.querySelectorAll(".btn-categorie-show");
let containerProduits  = document.querySelector(".container-produits ");
let containerCategories = document.querySelector(".container-categories");
let back = document.querySelector(".icon-back");
let href = document.querySelector(".btn-href");

btnCategorie.forEach(element => 
	element.addEventListener("click", (Event) => {
		
		
		back.style.display = "flex";
		
		
		if(window.location.href.indexOf("?idSousCat")> -1){
			console.log("ok");
			containerProduits.style.display = "flex";
			containerCategories.style.display = "none";
			Event.preventDefault();
		}
	})
);

back.addEventListener("click", () => {
	containerProduits.style.display = "none";
	containerCategories.style.display = "flex";
	back.style.display = "none";
})

function getMyid(idCat, idSousCat){

href.setAttribute("href", "?id="+idCat+"&idSousCat"+idSousCat);


}