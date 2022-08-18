<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="model.CategorieM"%> 
<%@page import="model.ProduitsM"%> 
<%@page import="model.PanierM"%> 
<%@page import="model.PanierDetailsM"%> 
<%@page import="java.util.ArrayList"%>  
    
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
<link href="css/modals/modal-inscription.css" rel="stylesheet">
<link href="css/pages/wishlist.css" rel="stylesheet">

<script type="text/javascript" defer src="js/modal-connexion.js"></script>
<script type="text/javascript" defer src="js/modal-inscription.js"></script>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

<title>WishList</title>
</head>
<body>
	<c:import url="/header"></c:import>
	<c:url value="/address" var="adresse"/>
	<c:url value="/panier" var="panier"/>
	<c:url value="/deleteFav" var="deleteFav"/>
	
	<div class="container-page-wishlist">
		<div class="container-page-wishlist-header">
			<h1 class="title-page-basket"> <a href="${panier}">Panier</a></h1>
			<h1 class="title-page-wishlist">Wishlist</h1>				
		</div>
		<div class="container-basket-wislist">
			
			<!-- Wish list Page -->

			<section class="container-wishlist">
				<div class="content-wishlist">
				
				<c:forEach items="${favoris}" var="fav">
					<article class="container-wishlist-product">
						<img class= "wishlist-product-img" alt="Image produit" src="<c:out value="${fav.id_produit.image }" />">
						<div class="content-wishlist-product">
							<div class="container-wishlist-product-infos">
								<a href="details?id=${fav.id_produit.id_produit}&param=findById"><h1><c:out value="${fav.id_produit.titre }" /></h1></a>	
								<p class="wishlist-product-subtitle">Feuille d'or</p>
							</div>
							<div class="container-wishlist-management">
								<p><c:out value="${fav.id_produit.prix }" /> €</p>
								<div class="container-wishlist-management-icon">
								
								<a href="${deleteFav}?idProd=${fav.id_produit.id_produit}"> 
									 <img class="wishlist-management-icon-wishlist" alt="Icon wishlist" src="assets/icon/wishlist-black.svg">
								</a>
								 
								<form method="post">
									<button name="btnAdd" value="${fav.id_produit.id_produit}">
										<img class="wishlist-management-icon-basket " alt="Icon ajout panier" src="assets/icon/basket-add.svg"> 
									</button>
								</form>		

								</div>
							</div>
						</div>
					</article>
				</c:forEach>
				
				</div>
			</section>
		</div>
	</div>	
</body>
</html>