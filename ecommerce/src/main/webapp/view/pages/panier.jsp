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
<link href="css/pages/panier.css" rel="stylesheet">

<script type="text/javascript" defer src="js/modal-connexion.js"></script>
<script type="text/javascript" defer src="js/modal-inscription.js"></script>
<script type="text/javascript" defer src="js/panier.js"></script>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

<title>Panier</title>
</head>
<body>
	<c:import url="/header"></c:import>
	<c:url value="/address" var="adresse"/>
	<c:url value="/confirmation" var="confirm"/>
	
	<div class="container-page-basket">
		<div class="container-basket-header">
			<h1 class="title-basket">Panier</h1>
			
		<% if((boolean)session.getAttribute("isConnected")==true){ %>
			<h1 class="title-wishlist">Wishlist</h1>           					
		<% } %>
			
			
		</div>
		<div class="container-basket-wislist">
			<section class="container-basket">
				<form method="post" class="container-basket-form">
					<div class="content-basket">
						<div class="content-basket-title">
							<h1>Votre Panier</h1>
						</div>
						<div class="container-basket-product-overflow">
						
						<!--  Produits dans le panier -->
						
					 <% PanierM paniers=(PanierM)session.getAttribute("panier");
            						for(PanierDetailsM pa:paniers.getArticles()){ 
            					%>
            					
            			
							<article class="container-basket-product">
							<img alt="Image produit" src="<%=pa.getProduit().getImage() %>" />
								<div class="content-basket-product">
									<div class="container-basket-product-infos">
										<div class="content-basket-product-infos">
										<a href="details?id=<%=pa.getProduit().getId_produit() %>&param=findById"><h1><%=pa.getProduit().getTitre() %></h1> </a>
											<p><%=pa.getProduit().getDescription() %></p>
										</div>
										<div class="content-basket-quantity-price">
											<input type="number" id="quantity" name="quantity" min="1" max="10" placeholder="0" value="<%=pa.getQte() %>">
											<p> <%=pa.getProduit().getPrix() %> €</p>
										</div>
									</div>
									<div class="container-delivery-and-supr">
										<p>Livraison offerte - Expédié sous 5 jours</p>
										
										 <a href="panier?idtodelete=<%=pa.getProduit().getId_produit() %>">Supprimer</a>
									</div>
								</div>
							</article>
								<% } %>	
						
					
						
							<!--  Prix et adresse de livraison -->
					
						</div>
					</div>
					<section class="container-total">
						<div class="content-total">
							<div class="container-total-title">
								<h1>Total</h1>
							</div>
							
							
							<div class="container-total-infos-command">
								<p class="total-nbr-articles" >Nombre d’articles différents : ${panier.count() } </p>
								
								
								<% if((boolean)session.getAttribute("isConnected")==false){ %>
									<div class="container-total-infos-command-client">
	            						<p>Adresse : Veuillez vous connecter et rafraîchir la page (F5)  </p>
	            					</div>
            					
								<% }else{ %>
				
								<div class="container-total-infos-command-client">
								
									<c:forEach items="${listAddress }" var="addressUser" varStatus="status">	
										<c:if test="${status.first }">
										
												<p>${InfosUser.prenom } ${InfosUser.nom}</p>
												<p>${addressUser.adresse} ${addressUser.code_postal} ${addressUser.ville}</p>
												<p>${InfosUser.telephone }</p>
												
												<a href="${adresse }">Changer d’adresse de livraison</a>
								   		</c:if>	
							</c:forEach>
								</div>
							<% } %>	
									
					
							</div>
						</div>
						<div class="container-basket-total-validate">
							<div class="container-basket-total-price">
								<p>Total</p>
								 <p>${panier.total()} €</p> 
							</div>
							<p class="basket-secure-payment">Paiement sécurisé</p>
							<div class="container-basket-btn">
							
							<% if((boolean)session.getAttribute("isConnected")==true){ %>
							
							<button name="btnCommande">Valider ma commande</button> 
							<% }else{ %>
							
							<p>Veuillez vous connecter pour valider votre commande</p>
							<% } %>	
							</div>
						</div>
					</section>
				</form>
			</section>
			
			<!-- Wish list Page -->

			<section class="container-wishlist">
				<div class="content-wishlist">
				
				<c:forEach items="${favoris}" var="fav">
					<article class="container-wishlist-product">
						<img class= "wishlist-product-img" alt="Image produit" src="<c:out value="${fav.id_produit.image }" />">
						<div class="content-wishlist-product">
							<div class="container-wishlist-product-infos">
								<h1><c:out value="${fav.id_produit.titre }" /></h1>
								<p class="wishlist-product-subtitle">Feuille d'or</p>
							</div>
							<div class="container-wishlist-management">
								<p><c:out value="${fav.id_produit.prix }" /> €</p>
								<div class="container-wishlist-management-icon">
								   <img class="wishlist-management-icon-wishlist" alt="Icon wishlist" src="assets/icon/wishlist-black.svg">
								<form method="post">
									<button type="submit" name="btnAdd" value="${fav.id_produit.id_produit}">
										<img alt="Icon ajout panier" src="assets/icon/basket-add.svg"> 
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