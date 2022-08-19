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

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>

<title>Clients</title>
</head>
<body>

	<div class="container-page-admin">

		<c:import url="admin-menu.jsp"></c:import>



		<section class="container-admin">
			<div class="container-title">
				<h1>Gestion des utilisateurs</h1>
			</div>
			<div class="container btn-filter">

				<form method="post">
					<button type="submit" name="btnFilterId"
						class="m-3 ml-3 btn btn-dark btn-filter-users">Filtrer par Id</button>
				</form>
				<form method="post">
					<button type="submit" name="btnFilterNom" class="m-3 btn btn-dark btn-filter-users">Filtrer
						par Nom</button>
				</form>
				<form method="post">
					<button type="submit" name="btnFilterPrenom"
						class="m-3 btn btn-dark btn-filter-users">Filtrer par Prenom</button>
				</form>
				<form method="post">
					<button type="submit" name="btnFilterMail" class="m-3 btn btn-dark btn-filter-users">Filtrer
						par Mail</button>
				</form>
				<form method="post">
					<div class="input-group m-3 input-group-search">
						<input type="text" class="form-control input-filter-users-search" placeholder="Recherche"
							aria-label="Recherche" aria-describedby="btnSearch"
							name="inputSearch">
						<button type="submit" name="btnSearch" class=" btn btn-dark btn-filter-users-search"
							id="btnSearch">Rechercher</button>
					</div>
				</form>
			</div>

			<section class="container-admin-users">

				<div class="overflow">
					<table class="table table-dark table-stripped table-hover">

						<thead>
							<tr>
								<th>User Id</th>
								<th>Nom</th>
								<th>Prenom</th>
								<th>Date d'inscription</th>
								<th>Email</th>
								<th>Telephone</th>
								<th>Details</th>
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
									<td><a href="adminUserDetails?id=${user.id_utilisateur }"><button
												type="button" class="btn btn-success btn-show-user">Show</button></a></td>
									<td>
										<button type="button" class="btn btn-danger btn-delete-user"
											data-bs-toggle="modal" data-bs-target="#modalSupp-<c:out value="${user.id_utilisateur }" />">Delete</button>
									</td>
								</tr>

								<div class="modal" id="modalSupp-<c:out value="${user.id_utilisateur }" />" tabindex="-1">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title">Suppression</h5>
												<button type="button" class="btn-close"
													data-bs-dismiss="modal" aria-label="Close"></button>
											</div>
											<div class="modal-body">
												<p>
													Etes-vous certains de vouloir supprimer l'utilisateur
													${user.id_utilisateur }
													?
												</p>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-secondary"
													data-bs-dismiss="modal">Retour</button>
												<a href="adminUser?idtodelete=${user.id_utilisateur}">
													<button type="submit" class="btn btn-danger">Supprimer
														</button>
												</a>
											</div>
										</div>
									</div>

								</div>

							</c:forEach>
						</tbody>

					</table>
				</div>
			</section>
		</section>



	</div>

</body>
</html>