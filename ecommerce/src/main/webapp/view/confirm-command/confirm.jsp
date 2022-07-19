<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<link href="css/_reset.css" rel="stylesheet" type="text/css">
<link href="css/header/header.css" rel="stylesheet">
<link href="css/footer/footer.css" rel="stylesheet">
<link href="css/confirm-command/confirm.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

<title>Confirmation de commande</title>

</head>
<body>

<c:import url="/header"></c:import>

<div class="container-confirm">


	<div class= "container-confirm-head"> <h3>Commande confirmée</h3></div>

	<div class="container-confirm-body">	
		<p class="date">Date : <br> 22/06/2022</p>

		<p class="msg-confirm">Votre commande n° NUMERO, d'un total de MONTANT€ est validée. Vous pouvez télécharger la facture de votre commande dans votre espace personnel, dans la rubrique Mon historique de commande. <br> <br></p>
		<p class="msg-end">Merci, à bientôt !</p>
		
	</div>




</div>

</body>
</html>