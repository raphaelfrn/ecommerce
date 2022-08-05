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
	
	<!-- Image -->
	 
	<div class="container-slider">
					
				<div id="carouselDetailsProduct" class="carousel slide" data-bs-ride="carousel">
			  <div class="carousel-indicators">
			  
			  	<c:forEach items="${image }" var="image" varStatus="status">
			  		<c:if test="${status.first }">
			    			<button type="button" data-bs-target="#carouselDetailsProduct" data-bs-slide-to="${image.id_image-1}" class="active" aria-current="true" aria-label="${image.id_image }"></button>
			   		</c:if>
			   		<c:if test="${!status.first }">
			   				<button type="button" data-bs-target="#carouselDetailsProduct" data-bs-slide-to="${image.id_image-1}" aria-label="${image.id_image}"></button>
			    	</c:if>
				</c:forEach>
			  </div>
			  
			  <div class="carousel-inner"> 
			 
				  <c:forEach items="${image }" var="image" varStatus="status">
				  	<c:if test="${status.first}">
					    <div class="carousel-item active">
					      <img src=" <c:out value="${image.url}"/>" class="d-block w-100" alt="${image.url}">
					    </div>
					</c:if>
					<c:if test="${!status.first }">
						<div class="carousel-item">
						 <img src=" <c:out value="${image.url}"/>" class="d-block w-100" alt="${image.url}">
						 </div>
					</c:if> 
				   </c:forEach>
			  </div>
			  
			  <button class="carousel-control-prev" type="button" data-bs-target="#carouselDetailsProduct" data-bs-slide="prev">
			    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
			    <span class="visually-hidden">Previous</span>
			  </button>
			  <button class="carousel-control-next" type="button" data-bs-target="#carouselDetailsProduct" data-bs-slide="next">
			    <span class="carousel-control-next-icon" aria-hidden="true"></span>
			    <span class="visually-hidden">Next</span>
			  </button>
			</div>
								
	
	</div>
	
	
	<!-- description -->
	<div class="container-description">
		
		<div class="container-title-icon"><p class="title">  <c:out value="${produit.titre }"/></p>  <img class="icon-bookmark"alt="bookmark" src="assets/icon/bookmark.svg"> </div>
		<p class="text-description"> <c:out value="${produit.description }"/></p>


			<div class="quantity-form">
				<form method="post">
					<label for="quantity">Quantité : </label> <input type="number" min="1" max="10" name="quantity" value="1">

					<div class="container-button-price">
						<button type="submit" name="btnAdd">
								<span>Ajouter au panier</span>
							</button>
						<h5>
							<c:out value="${produit.prix }" />
							€
						</h5>
					</div>
				</form>
			</div>

			<br>
	
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

			<div class="container-notation">
				<p>Mettre une note :</p>	
				<div class="rating">
					<input type="radio" name="rating" value="5" id="5"><label for="5">☆</label> <input type="radio" name="rating" value="4" id="4"><label for="4">☆</label> <input type="radio" name="rating" value="3" id="3"><label for="3">☆</label> <input type="radio" name="rating" value="2" id="2"><label for="2">☆</label> <input type="radio" name="rating" value="1" id="1"><label for="1">☆</label> </div> 
			</div>	
			
			
			
			<div class="comment-area"> 
					<div class="input-group mb-3">
				  			<input type="text" class="form-control" placeholder="Entrez votre commentaire" aria-label="Entrez votre commentaire" aria-describedby="button-addon">
				 			
				 			  <button> <span><img alt="plus button" src="assets/icon/plus.svg"></span> </button> 
					</div>
			 </div>
			
			
		</div>
		
		
		<!-- Hidden form for desktop only -->
		
		<div class="container-form-hidden">
			<div class="container-notation-hidden">
				<p>Ajouter un commentaire :</p>	
				<div class="rating">
					<input type="radio" name="rating" value="5" id="5"><label for="5">☆</label> <input type="radio" name="rating" value="4" id="4"><label for="4">☆</label> <input type="radio" name="rating" value="3" id="3"><label for="3">☆</label> <input type="radio" name="rating" value="2" id="2"><label for="2">☆</label> <input type="radio" name="rating" value="1" id="1"><label for="1">☆</label> </div> 
			</div>	
			
			
			
			<div class="comment-area-hidden"> 
					
				  			<input type="text" placeholder="Entrez votre commentaire" aria-label="Entrez votre commentaire" aria-describedby="button-addon">
				 			
				 			  <button> <span>Ajouter</span> </button> 
					
			 </div>
					
			</div>
		
		
		
		<!-- the card that will be in a loop to display comments -->
	
	
		<div class="card-comment">
		
		
			<div class="card-name-rating"><p><b>Nom du client</b></p> <div class="rating"><label>☆</label> <label>☆</label> <label>☆</label> <label>☆</label> <label>☆</label>
			</div> </div>
			
			<div class="container-msg"><hr>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean ac sapien egestas, porta lacus quis, congue neque. In libero massa, lobortis vel augue id, lobortis pellentesque turpis.</div>
		
		</div>
		
		
		<!--  another card just to see, delete this when loop is rdy -->
		
		
			
	
	
	
	
	
	
	
	</div>
	




	
	<c:import url="/view/footer/footer.jsp"></c:import>



</body>
</html>