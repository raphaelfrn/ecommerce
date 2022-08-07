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
<link href="css/pages/confirm.css" rel="stylesheet">
<link href="css/modals/modal-connexion.css" rel="stylesheet">
<link href="css/modals/modal-inscription.css" rel="stylesheet">


<script type="text/javascript" defer src="js/modal-connexion.js"></script>
<script type="text/javascript" defer src="js/modal-inscription.js"></script>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

<title>Confirmation de commande</title>
</head>
<body>
	<c:import url="/header"></c:import>

	<div class="container-page">
		<div class="container-confirm">
		<div class= "container-confirm-head">
			<h1>Commande confirmée</h1>
		</div> 
	<c:forEach items="${commande }" var="commande">
	
		<div class="container-confirm-body">	
			<div class="container-date">
				<p class="date"><strong>Date : </strong></p>
				<p><c:out value="${commande.dateC }" /></p>
			</div>
			<p class="msg-confirm"><strong>Votre commande n°</strong> <c:out value="${commande.id_commande }" />, d'un <strong>total</strong> de <c:out value="${commande.total }" />€ est validée. Vous pouvez télécharger la <strong> facture</strong> de votre commande dans votre espace personnel, dans la rubrique <strong> Mon historique de commande.</strong> <br> <br> </p>
			<p class="msg-end">Merci, à bientôt !</p>
			
		</div>
	</c:forEach>	
	</div>
	</div>
</body>
</html>