<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<link href="css/_reset.css" rel="stylesheet" type="text/css">
<link href="assets/font/font.css" rel="stylesheet">
<link href="css/header/header.css" rel="stylesheet">
<link href="css/footer/footer.css" rel="stylesheet">
<link href="css/pages/details-produit.css" rel="stylesheet">
<link href="css/modals/modal-connexion.css" rel="stylesheet">
<link href="css/modals/modal-inscription.css" rel="stylesheet">

<script type="text/javascript" defer src="js/modal-connexion.js"></script>
<script type="text/javascript" defer src="js/modal-inscription.js"></script>
<script type="text/javascript" defer src="js/details-produit.js"></script>


<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script  src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

<title>Details Produit</title>
</head>
<body>
	<c:import url="/header"></c:import>
	<c:url value="/panier" var="panier"/>
	
	<div class="container-slider-description">
		<div class="container-details-prod-row"> 
		<!-- Container for the image gallery -->
			<div class="container-slider-all">
			<!-- Full-width images  -->
				<div class="container-slider">
					<c:forEach items="${image }" var="image">
				 		 <div class="mySlides">
				    		  <img src="${image.url}">
				 		 </div>
					</c:forEach>	
					
				<!-- Next and previous buttons  -->
					<a class="prev" onclick="plusSlides(-1)">&#10094;</a>
				  	<a class="next" onclick="plusSlides(1)">&#10095;</a>
				</div>
			
				 <!-- Thumbnail images  -->
			    <div class="container-all-Thumbnail">
					<c:forEach items="${image }" var="image">
						<div class="content-all-Thumbnail">
					    	<img class="thumbnail cursor" src="${image.url}" alt="The Woods">
					    </div>
				    </c:forEach>
				</div>
			</div>

			<!-- description -->
			<div class="container-description">
				<div class="container-title-icon">
					<p class="title"><c:out value="${produit.titre }" /></p>
					<img class="icon-bookmark" alt="bookmark" src="assets/icon/bookmark.svg">
				</div>
				<p class="text-description"><c:out value="${produit.description }" /></p>
				<div class="quantity-form">
					<form method="post">
						<label for="quantity">Quantité : </label> <input type="number"min="1" max="10" name="quantity" value="1">
						<div class="container-button-price">
							<button type="submit" name="btnAdd"><span>Ajouter au panier</span></button>
							<h5><c:out value="${produit.prix }" /> € </h5>
						</div>
					</form>
				</div>
				<p class="text-paiement">Paiement sécurisé</p>
				<p class="text-delivery">Livraison offerte - Expédié sous 3 jours</p>
				<p class="text-delivery">Echanges et Retours Gratuits</p>
				<p class="comments">Commentaires</p>
			</div>
		</div>
		
			<!-- Comments -->
		<div class="container-comments">
			<!-- Add a comment and note on Mobile / tablette -->
			<div class="container-comments-form">
				<form method="post">
					<div class="container-notation">
						<p>Mettre une note :</p>	
						<div class="rating">
							<input type="radio" name="rating" value="5" id="5"><label for="5">☆</label> 
							<input type="radio" name="rating" value="4" id="4"><label for="4">☆</label> 
							<input type="radio" name="rating" value="3" id="3"><label for="3">☆</label> 
							<input type="radio" name="rating" value="2" id="2"><label for="2">☆</label> 
							<input type="radio" name="rating" value="1" id="1"><label for="1">☆</label> 
						</div> 
					</div>	
					
					<div class="comment-area"> 
						<div class="input-group mb-3">
							<input name="commentaire" type="text" class="form-control" placeholder="Entrez votre commentaire" aria-label="Entrez votre commentaire" aria-describedby="button-addon">
						 	<button type="submit" name="btnAddComm"> <span><img alt="plus button" src="assets/icon/plus.svg"></span></button> 
						</div>
					 </div>
				</form>			
			</div>
						
			<!-- Hidden form for desktop only -->
			<div class="container-form-hidden">
				<form method="post" onsubmit="return MinCharactersComment()">
					<div class="container-notation-hidden">
						<p>Ajouter un commentaire :</p>
						<div class="rating">
							<input type="radio" name="rating" value="5" id="5"><label for="5">☆</label> 
							<input type="radio" name="rating" value="4" id="4"><label for="4">☆</label> 
							<input type="radio" name="rating" value="3" id="3"><label for="3">☆</label> 
							<input type="radio" name="rating" value="2" id="2"><label for="2">☆</label> 
							<input type="radio" name="rating" value="1" id="1"><label for="1">☆</label>
						</div>
					</div>
					<div class="comment-area-hidden">
						<textarea name="commentaire" id="comment-product" placeholder="Entrez votre commentaire"
							aria-label="Entrez votre commentaire"
							aria-describedby="button-addon" maxlength="500"  minlength="10" value="" ></textarea>
						<button type="submit" name="btnAddComm"><span>Ajouter</span></button>
					</div>
				</form>
			</div>
		
			<!-- the card that will be in a loop to display comments -->
			<div class="container-all-comments-users">
				<c:forEach items="${commentaires }" var="comm">
					<div class="card-comment">
						<div class="card-name-rating">
							<p><b><c:out value="${comm.id_utilisateur.prenom }" /> <c:out value="${comm.id_utilisateur.nom }" /></b></p>
							<div class="rating"> <c:out value="${comm.note}" /></div> 
						</div>
						
						<div class="container-msg">
						<hr><c:out value="${comm.commentaire }" /></div>
				</div>
				</c:forEach>
			</div>
		</div>
	</div>
	

	<c:import url="/view/footer/footer.jsp"></c:import>
</body>
</html>