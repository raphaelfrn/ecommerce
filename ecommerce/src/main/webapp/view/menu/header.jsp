<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
    
 <script type="text/javascript" defer src="js/header.js"></script>
  <script type="text/javascript" defer src="js/alert-timeout.js"></script>
    
<header class="container-header">

	<c:url value="/home" var="home"/>
	<c:url value="/deconnexion" var="deconnexion"/>
	<c:url value="/sous-categories" var="sousCat"/>
	<c:url value="/account" var="account"/>
	<c:url value="/historique" var="historique"/>
	<c:url value="/recherche" var="recherche"/>
	<c:url value="/wishlist" var="wishlist"/>
	
	<nav class="container-nav-header">	
		<div data-bs-toggle="offcanvas" data-bs-target="#offcanvasWithBothOptions" aria-controls="offcanvasWithBothOptions"><img class="icon-menu" alt="icon menu" src="assets/icon/menu.svg"></div>
		<a href="${home}"> <img class="logo-dione" alt="logo Dione" src="assets/logo/logo-dione-black.svg"> </a>
		<div class="container-icon">
			<form class="form-search" action="${recherche }" > <input class="input-search" type="text" placeholder="Rechercher" name="search"></form>
			
			<a href=""><img class="icon icon-search" alt="Icon compte" src="assets/icon/search.svg"></a> 
			<% if((boolean)session.getAttribute("isConnected")==false){ %>
            	<a><img class="icon icon-connexion" alt="Icon compte" src="assets/icon/account.svg"></a> 
			<% }else{ %>
				<a><img class="icon header-account-click" alt="Icon compte" src="assets/icon/account.svg"></a>
				<p class="content-header-name-user header-account-click">Hello, ${InfosUser.prenom}</p> 
					<div class="container-header-account-choice">
						<div class="container-icon-close-user-choice">
							<img class="icon-close-user-choice" alt="Icon fermer" src="assets/icon/close.svg">	
						</div>
						<ul> 
							<li>
								<a href="${account}">Mon compte</a>
							</li>
							<li>
								<a href="${historique}">Historique de commande</a>
							</li>
							<li>
							
								<a href="${wishlist}">Wishlist</a>
							</li>
							<li>
								<a href="${deconnexion}">Déconnexion</a>
							</li>
						</ul>
					</div>
			<% } %>
			<a><img class="icon" alt="Icon panier" src="assets/icon/basket.svg" data-bs-toggle="offcanvas" data-bs-target="#offcanvasRight" aria-controls="offcanvasRight"></a>
		</div> 
	</nav>
	
	<div class="offcanvas offcanvas-start container-offcanvas" data-bs-scroll="true" tabindex="-1" id="offcanvasWithBothOptions" aria-labelledby="offcanvasWithBothOptionsLabel">
		<div class="offcanvas-header modal-header">
			<button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
		</div>
		<div class="offcanvas-body">
			<nav class="menu">
				<div class="content-menu">
					<a href="${home}">Accueil</a>
					
				<c:forEach items="${listCat }" var="categorie">	
					<a href="${sousCat}?idCat=${categorie.id_categorie}"><c:out value="${categorie.titre }"/></a> 
					</c:forEach>
				</div>
				<% if((boolean)session.getAttribute("isConnected")==true){ %>
	            	<div class="content-account">
						<a href="${account}">Mes informations</a> 
						<a href="${historique}">Mon historique de commandes</a>
					</div>
				<% } %>
			</nav>
	 	</div>
	</div>
	
	<c:if test="${msgConnexionNoo}">
		<div class="confirm-connexion ">
			<p>Vos identifiants ne sont pas corrects, veuillez réessayer</p>
		</div>
	</c:if>
	
	<c:import url="/modalConnexion"></c:import>
	<c:import url="/modalInscription"></c:import>
	<c:import url="/modalPanier"></c:import>
</header>