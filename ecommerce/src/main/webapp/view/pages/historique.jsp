<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<link rel="icon" href="assets/logo/favicon.ico" type="image/x-icon">
<link href="css/_reset.css" rel="stylesheet" type="text/css">
<link href="assets/font/font.css" rel="stylesheet">
<link href="css/header/header.css" rel="stylesheet">
<link href="css/pages/historique.css" rel="stylesheet">
<link href="css/modals/modal-connexion.css" rel="stylesheet">
<link href="css/modals/modal-inscription.css" rel="stylesheet">

<script type="text/javascript" defer src="js/modal-connexion.js"></script>
<script type="text/javascript" defer src="js/modal-inscription.js"></script>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script  src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

<title>Historique de commande</title>
</head>
<body>
	<c:import url="/header"></c:import>
	<c:url value="/detailsCommand" var="details"/>

	<div class="container-table">
		<div class="container-title">
			<h1>Historique de commande</h1>
		</div>
		<div class="container-data">
			<table>
				<thead>
					<tr>
						<th class="thead-first-three">N° commande</th>
						<th class="thead-first-three">Date</th>
						<th class="thead-first-three">Total</th>
						<th class="thead-2-last-two">Show</th>
					<!-- 	<th class="thead-2-last-two">Facture</th> -->
					</tr>
				</thead>
				<tbody>
				
					<c:forEach items="${listCommand }" var="commande">
					<tr>
						<td><c:out value="${commande.id_commande }" /></td>
						<td><c:out value="${commande.dateC }" /></td>
						<td><c:out value="${commande.total } €" /></td>
						<td><a href="${details}?idC=${commande.id_commande }"><img src="assets/icon/show.svg" alt="show"> </a></td>
						<!-- <td><img src="assets/icon/download.svg" alt="download"></td> -->
					</tr>
					</c:forEach>
					<tr>
					
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>