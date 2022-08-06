let basket = document.querySelector(".title-basket");
let wishlist = document.querySelector(".title-wishlist");

let containerBasket = document.querySelector(".container-basket");
let containerWishlist = document.querySelector(".container-wishlist");


wishlist.addEventListener('click', () => {
	containerBasket.style.display="none";
	containerWishlist.style.display="block";
})

basket.addEventListener('click', () => {
	containerWishlist.style.display="none";
	containerBasket.style.display="block";
})