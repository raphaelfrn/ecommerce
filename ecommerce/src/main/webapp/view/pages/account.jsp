<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="format-detection" content="telephone=no">

<link href="css/_reset.css" rel="stylesheet" type="text/css">
<link href="assets/font/font.css" rel="stylesheet">
<link href="css/header/header.css" rel="stylesheet">
<link href="css/pages/account.css" rel="stylesheet">
<link href="css/modals/modal-update.css" rel="stylesheet">

<script type="text/javascript" defer src="js/modal-update.js"></script>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

<title>Compte</title>
</head>
<body>
	<c:url value="/address" var="address"/>
	<c:url value="/historique" var="historique"/>
	
	<c:import url="/header"></c:import>
	
		<div class="container-account">
			<div class="container-clients">
				<div class="container-infos-client-first">
					<h1 class="infos-client-title">Vos informations</h1>
					<span class="infos-client-span">Me déconnecter</span>
				</div>
				
				<div class="container-client">
					<div class="container-infos-client">
						<p>Nom Prénom</p>
						<span class="update-fullname">Modifier</span>
					</div>
					<div class="container-infos-client">
						<p>email@gmail.com</p>
						<span class="update-mail">Modifier</span>
					</div>
				</div>
				
				<div class="container-client">
					<h1>Adresse</h1>
					<div class="container-infos-client">
						<p>14 Avenue du Marachal Fosch</p>
						<a href="${address}"><img class="icon-arrow update-address" alt="Icon flêche" src="assets/icon/arrow.svg"></a>
					</div>
					<p>75000 Paris, France</p>
				</div>
				
				<div class="container-client">
					<div class="container-infos-client">
						<h1>Téléphone</h1>
						<span class="update-phone">Modifier</span>
					</div>
					<p>07 00 64 00 18</p>
				</div>
				
				<div class="container-infos-client">
					<p>Mot de passe *******</p>
					<span class="update-pwd">Modifier</span>
				</div>
			</div>
			
			<div class="container-command">
				<div class="container-last-order">
					<h1>Votre dernier achat</h1>
					<div class="container-last-order-infos">
						<p>Vendredi 12, Mars</p>
						<div>
							<span>9895,95 EUR</span>
							<a>Voir la commande</a>
						</div>
					</div>
					<div class="container-last-order-img">
						<img alt="Image produit" src="assets/img/enceintes/Phantom-1/Phantom-1-White1.webp">
						<img alt="Image produit" src="assets/img/enceintes/Phantom-2/Phantom-2-Black1.webp">
						<img alt="Image produit" src="assets/img/enceintes/Phantom-1/Phantom-1-Opera3.webp">
					</div>
				</div>
				<a class="title-order-history" href="${historique}">Historique de commande</a>
			</div>
		</div>
	<c:import url="/modalUpdate"></c:import>
</body>
</html>