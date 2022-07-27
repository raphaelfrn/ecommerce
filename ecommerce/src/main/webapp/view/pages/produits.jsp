<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<link rel="icon" href="assets/logo/favicon.ico" type="image/x-icon">
<link href="css/_reset.css" rel="stylesheet" type="text/css">
<link href="assets/font/font.css" rel="stylesheet">
<link href="css/header/header.css" rel="stylesheet">
<link href="css/footer/footer.css" rel="stylesheet">
<link href="css/pages/produits.css" rel="stylesheet">
<link href="css/modals/modal-connexion.css" rel="stylesheet">
<link href="css/modals/modal-inscription.css" rel="stylesheet">


<script type="text/javascript" defer src="js/modal-connexion.js"></script>
<script type="text/javascript" defer src="js/modal-inscription.js"></script>

<script type="text/javascript" defer src="js/muted-video.js"></script>
<script type="text/javascript" defer src="js/produits.js"></script>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

<title>Produits</title>
</head>

<body>
	<c:url value="/details" var="details"/>
	<c:import url="/header"></c:import>	
	
	<div class="container-hero">
		<video class="video-hero" muted autoplay="autoplay" loop preload="auto">
	          <source src="assets/video/hp-2.mp4" type="video/mp4">
        </video>
		<div class="container-hero-infos">
			<img class="icon-sound" alt="Icon son" src="assets/icon/sound.svg">
		</div>
	</div>
	
	<div class="container-categories">
		<div class="container-categorie">
			<img alt="Image produits de la catégorie ..." src="https://assets.devialet.com/fr-fr/media/dvl_media/Range_Phantom_I_Logo_1000x1000.png?twic=v1/background=FFFFFF/cover=800x800">
			<h1>Phantom I</h1>
			<div class="container-categorie-btn">
				<button class="btn-categorie-show">Découvrir</button>
			</div>
		</div>
		<div class="container-categorie">
			<img alt="Image produits de la catégorie ..." src="https://assets.devialet.com/fr-fr/media/dvl_media/Range_Phantom_II_Logo_1000x1000.png?twic=v1/background=FFFFFF/cover=800x800">
			<h1>Phantom II</h1>
			<div class="container-categorie-btn">
				<button class="btn-categorie-show">Découvrir</button>
			</div>
		</div>
	</div>
	
	<img class="icon-back" alt="Icon retour" src="assets/icon/back.svg">
	<div class="container-produits scrolling-wrapper">
	
	
	<c:forEach items="${list }" var="produits">
	
		<div class="container-card-produit">
			<div class="card-produit-top">
				<h1> <c:out value="${produits.titre }" /> </h1>
				<a href="${details}">Détails</a>
			</div>
			<div class="container-card-produit-img">
				<img alt="Image produit" src=" <c:out value="${produits.image }"/>">
			</div>
			<div class="card-produit-bottom">
			
				<div class="card-produit-infos">
					<p><c:out value="${produits.prix }"/> €</p>
					<img alt="Icon étoile" src="assets/icon/star.svg">
					<span>4,5</span>
				</div>
	
				<div class="card-produit-icons-add">
					<img alt="Icon d'ajout à la liste de favoris" src="assets/icon/wishlist-add.svg">
					<img alt="Icon ajout panier" src="assets/icon/basket-add.svg">
				</div>
			</div>
		</div>
		
		</c:forEach>
		
		
		

	</div>
	
	<c:import url="/view/footer/footer.jsp"></c:import>
</body>
</html>