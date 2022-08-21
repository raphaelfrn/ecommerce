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
  
  <% if ( ((PanierM)session.getAttribute("panier")).getArticles().isEmpty() ){ %>

		<div class="container-modal-panier-top">
			<h1>Votre panier est vide</h1>
		</div>
<div><br></div>

<form method="post">
		<div class="container-modal-panier-btn">
			
				<button class="modal-panier-btn-shop">
					<span>Continuer mon shopping</span>
				</button>
		
		</div>
	</form>

		<%
		} else {
		%>
		
		<div class="container-modal-panier-top">
			<h1>Panier</h1>
			<a href="${panier}">Voir mon panier</a>
		</div>

		<form method="post">
			<div class="container-overflow">
				<%
				PanierM paniers = (PanierM) session.getAttribute("panier");
				for (PanierDetailsM pa : paniers.getArticles()) {
				%>

				<div class="container-modal-panier-product">
					<div class="container-modal-panier-product-infos">
						<div class="modal-panier-product-infos">
							<a
								href="details?id=<%=pa.getProduit().getId_produit()%>&param=findById"><h1><%=pa.getProduit().getTitre()%></h1></a>
							<p>Feuille d'or</p>
						</div>
						<div>
							<input type="number"
								id="quantity<%=pa.getProduit().getId_produit()%>"
								name="inputQuantity" min="1" max="10" placeholder="0"
								value="<%=pa.getQte()%>" readonly>
						</div>
					</div>
					<div class="modal-panier-product-price">
						<button type="submit" name="btnDelete"
							value="<%=pa.getProduit().getId_produit()%>">Supprimer</button>
						<p><%=pa.getProduit().getPrix()%>
							€
						</p>
					</div>
				</div>

				<% } %>


			</div>


			<div>
				<div class="container-modal-total">
					<p>Total :</p>
					<p>${total} &euro;</p>
				</div>

				<div class="container-modal-panier-btn">
					<a href="${panier}" class="modal-panier-btn-validate"><span>Valider</span></a>
				</div>

				<div class="container-modal-panier-btn">
					<button class="modal-panier-btn-shop">
						<span>Continuer mon shopping</span>
					</button>
				</div>
			</div>

		</form>
		<% } %>
  </div>
</div>