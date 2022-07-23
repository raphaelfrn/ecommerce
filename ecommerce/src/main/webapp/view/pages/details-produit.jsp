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
<script type="text/javascript" defer src="js/modal-connexion.js"></script>


<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script  src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

<title>Details Produit</title>
</head>
<body>
	<c:import url="/header"></c:import>
	
	
	<div class="container-slider-description">
	
	<!-- Image -->
	 
	<div class="container-slider">
	
	
				
				<div id="carouselDetailsProduct" class="carousel slide" data-bs-ride="carousel">
			  <div class="carousel-indicators">
			    <button type="button" data-bs-target="#carouselDetailsProduct" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
			    <button type="button" data-bs-target="#carouselDetailsProduct" data-bs-slide-to="1" aria-label="Slide 2"></button>
			    <button type="button" data-bs-target="#carouselDetailsProduct" data-bs-slide-to="2" aria-label="Slide 3"></button>
			      <button type="button" data-bs-target="#carouselDetailsProduct" data-bs-slide-to="3" aria-label="Slide 4"></button>
			         <button type="button" data-bs-target="#carouselDetailsProduct" data-bs-slide-to="4" aria-label="Slide 5"></button>
			            
			  </div>
			  <div class="carousel-inner">
			    <div class="carousel-item active">
			      <img src="assets/img/enceintes/Phantom-1/Phantom-1-Black1.webp" class="d-block w-100" alt="First slide">
			    </div>
			    <div class="carousel-item">
			      <img src="assets/img/enceintes/Phantom-1/Phantom-1-Black2.webp" class="d-block w-100" alt="Second slide">
			    </div>
			    <div class="carousel-item">
			      <img src="assets/img/enceintes/Phantom-1/Phantom-1-Black3.webp" class="d-block w-100" alt="Third slide">
			    </div>
			     <div class="carousel-item">
			      <img src="assets/img/enceintes/Phantom-1/Phantom-1-Black4.webp" class="d-block w-100" alt="Fourth slide">
			    </div>
			     <div class="carousel-item">
			      <img src="assets/img/enceintes/Phantom-1/Phantom-1-Black5.webp" class="d-block w-100" alt="Fifth slide">
			    </div>
			   
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
		
		<div class="container-title-icon"><p class="title">PHANTOM 1</p>  <img class="icon-bookmark"alt="bookmark" src="assets/icon/bookmark.svg"> </div>
		<p class="text-description">Une puissance indécente, des basses ultra-profondes.</p>
		
		<div class="quantity-form">
		<form> <label for="quantity">Quantité : </label>	<input type="number" name="quantity"></form>
		
		
		
		
		
		</div> 
		<div class="container-button-price"><button type="submit"> <span>Ajouter au panier</span> </button> <h5>1200€</h5> </div>	
	
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