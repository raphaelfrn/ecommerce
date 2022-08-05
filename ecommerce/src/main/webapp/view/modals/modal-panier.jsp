<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="model.CategorieM"%> 
<%@page import="model.ProduitsM"%> 
<%@page import="model.PanierM"%> 
<%@page import="model.PanierDetailsM"%> 
<%@page import="java.util.ArrayList"%>     
    
<!DOCTYPE html>
<meta charset="UTF-8">
<link href="css/modals/modal-panier.css" rel="stylesheet">

<c:url value="/panier" var="panier"/>

<div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasRight" aria-labelledby="offcanvasRightLabel">
  <div class="offcanvas-header modal-header modal-header-panier">
    <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
  </div>
  <div class="offcanvas-body modal-panier-body">
   	<div class="container-modal-panier-top">
   		<h1>Panier</h1>
   		<a href="${panier}">Voir mon panier</a>
   	</div>
   	
   	<form action="${panier}">
   		<div class="container-overflow">

   		
   		 <% PanierM panierM=(PanierM)session.getAttribute("panier");
         for(PanierDetailsM pa:panierM.getArticles()){ 
            					%>
   		
		   		<div class="container-modal-panier-product">
		   			<div class="container-modal-panier-product-infos">
		   				<div class="modal-panier-product-infos">
		   					<h1><%=pa.getProduit().getTitre() %></h1>
		   					<p>Feuille d'or</p>
		   				</div>
		   				<div><input type="number" id="quantity" name="quantity" min="1" max="10" placeholder="0"></div>
		   			</div>
		   			<div class="modal-panier-product-price">
		   				<a>Supprimer</a>
		   				<p><%=pa.getProduit().getPrix() %> €</p>
		   			</div>
		   		</div>
		   		
	   		<% } %>
	   		

   		</div>
   		
   		<div>
   			<div class="container-modal-total">
	   			<p>Total :</p>
	   			<p>3724 €</p>
   			</div>
   			<div class="container-modal-panier-btn">
   			<button class="modal-panier-btn-validate"><span>Valider</span></button>
   			</div>
   			<div class="container-modal-panier-btn">
   				<button class="modal-panier-btn-shop"><span>Continuer mon shopping</span></button>
   			</div>
   		</div>
   	</form>

  </div>
</div>