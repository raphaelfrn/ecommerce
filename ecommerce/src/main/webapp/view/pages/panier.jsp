<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<link rel="icon" href="assets/logo/favicon.ico" type="image/x-icon">
<link href="css/_reset.css" rel="stylesheet" type="text/css">
<link href="assets/font/font.css" rel="stylesheet">
<link href="css/header/header.css" rel="stylesheet">
<link href="css/modals/modal-connexion.css" rel="stylesheet">
<link href="css/pages/panier.css" rel="stylesheet">

<script type="text/javascript" defer src="js/modal-connexion.js"></script>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

<title>Panier</title>
</head>
<body>
	<c:import url="/header"></c:import>
	
	<div class="container-page-basket">
		<div class="container-basket-header">
			<h1>Panier</h1>
			<h1>Wishlist</h1>
		</div>

		<div class="container-basket-wislist">
			<section class="container-basket">
				<form class="container-basket-form">
					<div class="content-basket">
						<div class="content-basket-title">
							<h1>Votre Panier</h1>
						</div>
						
						<div class="container-basket-product-overflow">
							<article class="container-basket-product">
							<img alt="Image produit"
								src="assets/img/enceintes/Phantom-1/Phantom-1-Orange1.webp">
							<div class="content-basket-product">
								<div class="container-basket-product-infos">
									<div class="content-basket-product-infos">
										<h1>PHANTOM II 98 DB OPÉRA DE PARIS</h1>
										<p>Feuille d'or</p>
									</div>
									<div class="content-basket-quantity-price">
										<input type="number" id="quantity" name="quantity" min="1" max="10" placeholder="0">
										<p>1335 €</p>
									</div>
								</div>
								<div class="container-delivery-and-supr">
									<p>Livraison offerte - Expédié sous 5 jours</p>
									<a href="">Supprimer</a>
								</div>
							</div>
						</article>
						
						<article class="container-basket-product">
							<img alt="Image produit"
								src="assets/img/enceintes/Phantom-1/Phantom-1-Orange1.webp">
							<div class="content-basket-product">
								<div class="container-basket-product-infos">
									<div class="content-basket-product-infos">
										<h1>PHANTOM II 98 DB OPÉRA DE PARIS</h1>
										<p>Feuille d'or</p>
									</div>
									<div class="content-basket-quantity-price">
										<input type="number" id="quantity" name="quantity" min="1"
											max="10" placeholder="0">
										<p>1335 €</p>
									</div>
								</div>
								<div class="container-delivery-and-supr">
									<p>Livraison offerte - Expédié sous 5 jours</p>
									<a href="">Supprimer</a>
								</div>
							</div>
						</article>
								
						<article class="container-basket-product">
							<img alt="Image produit"
								src="assets/img/enceintes/Phantom-1/Phantom-1-Orange1.webp">
							<div class="content-basket-product">
								<div class="container-basket-product-infos">
									<div class="content-basket-product-infos">
										<h1>PHANTOM II 98 DB OPÉRA DE PARIS</h1>
										<p>Feuille d'or</p>
									</div>
									<div class="content-basket-quantity-price">
										<input type="number" id="quantity" name="quantity" min="1"
											max="10" placeholder="0">
										<p>1335 €</p>
									</div>
								</div>
								<div class="container-delivery-and-supr">
									<p>Livraison offerte - Expédié sous 5 jours</p>
									<a href="">Supprimer</a>
								</div>
							</div>
						</article>
						
						<article class="container-basket-product">
							<img alt="Image produit"
								src="assets/img/enceintes/Phantom-1/Phantom-1-Orange1.webp">
							<div class="content-basket-product">
								<div class="container-basket-product-infos">
									<div class="content-basket-product-infos">
										<h1>PHANTOM II 98 DB OPÉRA DE PARIS</h1>
										<p>Feuille d'or</p>
									</div>
									<div class="content-basket-quantity-price">
										<input type="number" id="quantity" name="quantity" min="1"
											max="10" placeholder="0">
										<p>1335 €</p>
									</div>
								</div>
								<div class="container-delivery-and-supr">
									<p>Livraison offerte - Expédié sous 5 jours</p>
									<a href="">Supprimer</a>
								</div>
							</div>
						</article>
						
						<article class="container-basket-product">
							<img alt="Image produit"
								src="assets/img/enceintes/Phantom-1/Phantom-1-Orange1.webp">
							<div class="content-basket-product">
								<div class="container-basket-product-infos">
									<div class="content-basket-product-infos">
										<h1>PHANTOM II 98 DB OPÉRA DE PARIS</h1>
										<p>Feuille d'or</p>
									</div>
									<div class="content-basket-quantity-price">
										<input type="number" id="quantity" name="quantity" min="1"
											max="10" placeholder="0">
										<p>1335 €</p>
									</div>
								</div>
								<div class="container-delivery-and-supr">
									<p>Livraison offerte - Expédié sous 5 jours</p>
									<a href="">Supprimer</a>
								</div>
							</div>
						</article>
						</div>
					</div>
					
					<section class="container-total">
						<div class="content-total">
							<div class="container-total-title">
								<h1>Total</h1>
							</div>
							<div class="container-total-infos-command">
								<p class="total-nbr-articles" >Nombre d’articles :  2</p>
								<div class="container-total-infos-command-client">
									<p>Marc Roux</p>
									<p>10 rue Victor Hugo, 75006 Paris</p>
									<p>0768121315</p>
									<a>Changer d’adresse de livraison</a>
								</div>
								<p class="total-infos-command-delivery">Date de livraison</p>
							</div>
						</div>

						<div class="container-basket-total-validate">
							<div class="container-basket-total-price">
								<p>Total</p>
								<p>3724 €</p>
							</div>
							<p class="basket-secure-payment">Paiement sécurisé</p>
							<div class="container-basket-btn">
								<button>Valider ma commande</button>
							</div>
						</div>
					</section>
				</form>
			</section>

			<section class="container-wishlist">
				<div class="content-wishlist"></div>
			</section>
		</div>
	</div>
	
</body>
</html>