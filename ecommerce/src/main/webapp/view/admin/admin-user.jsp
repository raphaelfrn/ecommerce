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
		<div class="container-title">
							<h1>Gestion des utilisateurs</h1>
						</div>
	<div class="btn-filter">
	
	<form method="post"><button type="submit" name="btnFilterId">Filtrer par Id</button></form>
	<form method="post"><button type="submit" name="btnFilterNom">Filtrer par Nom</button></form>
	<form method="post"><button type="submit" name="btnFilterPrenom">Filtrer par Prenom</button></form>
	<form method="post"><button type="submit" name="btnFilterMail">Filtrer par Mail</button></form>
	</div>					
		
			<section  class="container-admin-users">
			
						
				<table>
					<thead>
						<tr>
							<th>User Id</th>
							<th>Nom</th>
							<th>Prenom</th>
							<th>Date d'inscription</th>
							<th>Email</th>
							<th>Telephone</th>
							<th>Update</th>
							<th>Delete</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${listUser }" var="user">
							<tr>
								<td><c:out value="${user.id_utilisateur }" /></td>
								<td><c:out value="${user.nom }" /></td>
								<td><c:out value="${user.prenom }" /></td>
								<td><c:out value="${user.date_inscription }" /></td>
								<td><c:out value="${user.email }" /></td>
								<td><c:out value="${user.telephone }" /></td>
								<td><a href="adminUserDetails?id=${user.id_utilisateur }">Details</a></td>
								<td> <a href="adminUser?idtodelete=${user.id_utilisateur}">Delete</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</section>
		</section>
	</div>

</body>
</html>