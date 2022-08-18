<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="format-detection" content="telephone=no">

<link rel="icon" href="assets/logo/favicon.ico" type="image/x-icon">
<link href="css/_reset.css" rel="stylesheet" type="text/css">
<link href="assets/font/font.css" rel="stylesheet">
<link href="css/header/header.css" rel="stylesheet">
<link href="css/pages/address.css" rel="stylesheet">
<link href="css/modals/modal-add.css" rel="stylesheet">
<link href="css/modals/modal-connexion.css" rel="stylesheet">
<link href="css/modals/modal-inscription.css" rel="stylesheet">

<script type="text/javascript" defer src="js/modal-connexion.js"></script>
<script type="text/javascript" defer src="js/modal-add.js"></script>
<script type="text/javascript" defer src="js/modal-inscription.js"></script>
<script type="text/javascript" defer src="js/address.js"></script>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

<title>Vos adresses</title>
</head>
<body>
		<c:url value="/account" var="account"/>

		<c:import url="/modalAdd"></c:import>
		<c:import url="/header"></c:import>
		
		<div class="container-back-address"><a class="back-address" href="${account}" >Retour</a></div>
		<div class="container-page">
			<div class="container-all-address">
				<div class="container-address-title">
					<h1 class="address-title">Votre adresse de livraison</h1>
				</div>
				
				<c:forEach items="${listAddress }" var="addressUser" varStatus="status">	
					<c:if test="${status.first }">
						<div class="container-address">
							<h1>Adresse par default</h1>
							<p>${addressUser.adresse}</p>
							<p>${addressUser.code_postal} ${addressUser.ville}, ${addressUser.pays}</p>
						</div>
			   		</c:if>	
				</c:forEach>

				<div class="overflow-address">
					<c:forEach items="${listAddress }" var="addressUser" varStatus="status">	
						<c:if test="${!status.first }">
							<div class="container-address container-address-modifier">
								<h1>Adresse</h1>
								<p>${addressUser.adresse}</p>
								<p>${addressUser.code_postal} ${addressUser.ville}</p>
								<div class="container-address-choice">
									<p>${addressUser.pays}</p>
									<a href="">Chosir comme adresse par default</a>
								</div>
								<div class="container-delete-address">
									<a class="delete-address" href="">Supprimer</a>
								</div>
							</div>
				   		</c:if>	
					</c:forEach>	
				</div>
			</div>
			
			<div class="container-address-add">
				<div class="container-address-add-hide">
					<div class="container-first-title-adress"><h1 class="first-title-adress">Ajouter une nouvelle adresse de livraison</h1></div>					
					<form method="post" onsubmit="return verifAddress()">
						<div class="container-input-add-address">
							<input type="text" id="addressAdd" name="address" placeholder="Adresse" >
							<input class="address-input-txtOnly" type="text" id="cityAdd" name="city" placeholder="Ville" >
							<input class="addressZipCode" type="text" id="zipCodeAdd" name="zipCode" placeholder="Code Postal" >
							<input class="address-input-txtOnly" type="text" id="countryAdd" name="country" placeholder="Pays" >
							<div class="container-alerty-address"><p class="alerty-address"></p></div>
						</div>
						<div class="container-btn-add-address">
							<button class="btn-add-address" name="btnAddPageAddress">Ajouter</button>
						</div>
					</form>
				</div>
				<p class="title-add-address">Ajouter une Nouvelle adresse de livraison</p>
			</div>
		</div>	
</body>
</html>