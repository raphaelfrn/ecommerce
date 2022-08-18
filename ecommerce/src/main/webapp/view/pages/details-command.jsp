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
<link href="css/pages/details-command.css" rel="stylesheet">
<link href="css/modals/modal-connexion.css" rel="stylesheet">
<link href="css/modals/modal-inscription.css" rel="stylesheet">

<script type="text/javascript" defer src="js/modal-connexion.js"></script>
<script type="text/javascript" defer src="js/modal-inscription.js"></script>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

<title>Insert title here</title>
</head>
<body>
	<c:import url="/header"></c:import>
	
	<div class="container-title">
		<h1>Commande n° <c:out value="${commande.id_commande }" />, Le <c:out value="${commande.dateC }" /> </h1>
	</div>
	<div class="container-page container-page-detail-co">
		<div class="container-overflow-details-command">
		
		<c:forEach items="${listDC }" var="DC">
			<div class="container-row-details-command">
			<img alt="Image produit" src="<c:out value="${DC.id_produit.image }" />">
				<div class="container-details-command">
					<div class="container-infos-product">
					<a href="details?id=${DC.id_produit.id_produit}&param=findById">	<h1> <c:out value="${DC.id_produit.titre }" /> </h1></a>
						<p>Feuille d'or</p>
					</div>
					<div class="container-price">
						<span><c:out value="${DC.quantite }" /></span>
						<p><c:out value="${DC.prix }" /> €</p>
					</div>
				</div>
			</div>
		</c:forEach>
	
		</div>
		
		<div class="container-total">
			<p class="price-product">Total:</p>
			<p class="price-product"><c:out value="${commande.total }" /> €</p>
			<!-- <div class="container-download">
				<p>Telecharger ma facture</p>
				<img class="icon-download" alt="Icon de téléchargement" src="assets/icon/download-white.svg">
			</div> -->
		</div>
	</div>
</body>
</html>