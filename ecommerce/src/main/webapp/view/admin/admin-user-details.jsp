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
<link href="css/admin/admin-menu.css" rel="stylesheet">
<link href="css/admin/admin-user.css" rel="stylesheet">


<title>Clients</title>
</head>
<body>

	<div class="container-page-admin">
		
		<c:import url="admin-menu.jsp"></c:import>
		
		
		
		<section class="container-admin">
		
			<div class="container-user-infos">
			
				<p>${UserInfo.id_utilisateur}</p>
				<p>${UserInfo.nom } ${UserInfo.prenom }</p>
				<p>${UserInfo.date_inscription } </p>
				<p>${UserInfo.email } </p>
				<p>${UserInfo.telephone } </p> 
			
			</div>
			
			<div class="container-commands">
			
			<table>
				<thead>
					<tr>
						<th>N° commande</th>
						<th>Date</th>
						<th>Total</th>
						<th>Show</th>
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
			
		
		
		</section>
	</div>

</body>
</html>