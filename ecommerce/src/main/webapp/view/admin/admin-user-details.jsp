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
<link href="css/admin/admin-user-details.css" rel="stylesheet">

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

			<div class="container container-infos-address">

				<!-- Informations utilisateur -->
				<div class="container container-user-infos">
					<h1>Infos utilisateur</h1>
					<div class="overflow">
						<form method="post">
							<div class="row">
								<div class="col">
									<label for="idUser" class="form-label">Id utilisateur</label> <input
										type="text" class="form-control" placeholder="First name"
										aria-label="First name" id="idUser"
										value="${UserInfo.id_utilisateur }" disabled readonly>
								</div>
								<div class="col">
									<label for="dateInscription" class="form-label">Date
										d'inscription</label> <input type="text" class="form-control"
										placeholder="Last name" aria-label="Last name"
										id="dateInscription" value="${UserInfo.date_inscription }"
										disabled readonly>
								</div>
							</div>
							<div class="row">
								<div class="col">
									<label for="inputNom" class="form-label">Nom</label> <input
										type="text" class="form-control" placeholder="First name"
										aria-label="First name" id="inputNom" name="name"
										value="${UserInfo.nom }">
								</div>
								<div class="col">
									<label for="inputPrenom" class="form-label">Prenom</label> <input
										type="text" class="form-control" placeholder="Last name"
										aria-label="Last name" id="inputPrenom" name="prenom"
										value="${UserInfo.prenom }">
								</div>
							</div>
							<div class="row">
								<div class="col">
									<label for="inputMail" class="form-label">Mail</label> <input
										type="text" class="form-control" aria-label="First name"
										id="inputMail" name="email" value="${UserInfo.email }">
								</div>
								<div class="col">
									<label for="inputTelephone" class="form-label">Telephone</label>
									<input type="text" class="form-control" aria-label="Last name"
										id="inputTelephone" name="tel" value="${UserInfo.telephone }">
								</div>
							</div>

							<button type="submit" class="mt-3 btn btn-success"
								name="btnUpdate">Modifier</button>

						</form>
					</div>
				</div>

				<!-- Adresses -->

				<div class="container container-user-address">
					<h1>Adresses</h1>
					<div class="overflow">
						<table class="table table-dark table-stripped">
							<thead>
								<tr>
									<th scope="col">Id adresse</th>
									<th scope="col">Adresse</th>
									<th scope="col">Code Postal</th>
									<th scope="col">Ville</th>
									<th scope="col">Pays</th>
								</tr>
							</thead>
							<tbody>

								<c:forEach items="${listAddress }" var="addressUser">
									<tr>
										<td><c:out value="${addressUser.id_adresse_livraison }" /></td>
										<td><c:out value="${addressUser.adresse }" /></td>
										<td><c:out value="${addressUser.code_postal }" /></td>
										<td><c:out value="${addressUser.ville }" /></td>
										<td><c:out value="${addressUser.pays }" /></td>

									</tr>
								</c:forEach>
								<tr>
							</tbody>
						</table>
					</div>
				</div>

			</div>
			<div class="container container-commands-details">

				<!-- 	Commandes -->
				<div class="container container-commands">
					<h1>Commandes</h1>
					<div class="overflow">
						<table class="table table-dark table-stripped">
							<thead>
								<tr>
									<th>N° commande</th>
									<th>Date</th>
									<th>Total</th>
									<th>Show</th>
								</tr>
							</thead>
							<tbody>

								<c:forEach items="${listCommand }" var="commande">
									<tr>
										<td><c:out value="${commande.id_commande }" /></td>
										<td><c:out value="${commande.dateC }" /></td>
										<td><c:out value="${commande.total } €" /></td>
										<td><form method="post">
												<button type="submit" class="btnDetails" name="btnDetailsC"
													value="${commande.id_commande }">
													<img src="assets/icon/show.svg" alt="show">
												</button>
											</form></td>
									</tr>
								</c:forEach>
								<tr>
							</tbody>
						</table>
					</div>
				</div>
				<!-- 	details commande -->
				<div class="container container-details">

					<h1>Details commande</h1>
					<div class="overflow">
						<table class="table table-dark table-stripped table-hover">
							<thead>
								<tr>
									<th>Id commande</th>
									<th>Id Details commande</th>
									<th>Produit</th>
									<th>Quantite</th>
									<th>Prix</th>
								</tr>
							</thead>
							<tbody>

								<c:forEach items="${listDC }" var="DC">
									<tr>
										<td><c:out value="${DC.id_details_commande }" /></td>
										<td><c:out value="${DC.id_commande.id_commande }" /></td>
										<td><c:out value="${DC.id_produit.titre }" /> (id <c:out
												value="${DC.id_produit.id_produit }" />)</td>
										<td><c:out value="${DC.quantite }" /></td>
										<td><c:out value="${DC.prix }" /></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>

						<div class="container date-prix">
							<p>
								Date de la commande :
								<c:out value="${SingleCommand.dateC }" />
							</p>
							<p>
								Total de la commande : 
								<c:out value="${SingleCommand.total }"/> €
							</p>

						</div>

					</div>
				</div>

			</div>

			<div class="container container-comm-contact">
				<!-- Commentaires -->
				<div class="container container-commentaires">
					<h1>Commentaires</h1>
					<div class="overflow">
						<table class="table table-dark table-stripped table-hover" >
							<thead>
								<tr>
									<th>Id commentaire</th>
									<th>Commentaire</th>
									<th>Note</th>
									<th>Id_produit</th>
									<!-- 	<th class="thead-2-last-two">Facture</th> -->
								</tr>
							</thead>
							<tbody>

								<c:forEach items="${listCommentaires }" var="commentaires">
									<tr>
										<td><c:out value="${commentaires.id_commentaire }" /></td>
										<td><c:out value="${commentaires.commentaire }" /></td>
										<td><c:out value="${commentaires.note }" /></td>
										<td><c:out value="${commentaires.id_produit.id_produit }" /></td>

									</tr>
								</c:forEach>
								<tr>
							</tbody>
						</table>
					</div>
				</div>
				<!-- Contact -->
				<div class="container container-contact">
					<h1>Contact</h1>
					<div class="overflow">
						<table class="table table-dark table-stripped table-hover">
							<thead>
								<tr>
									<th>Id contact</th>
									<th>Sujet</th>
									<th>Message</th>
									<th>Etat</th>
									<!-- 	<th class="thead-2-last-two">Facture</th> -->
								</tr>
							</thead>
							<tbody>

								<c:forEach items="${listContact }" var="contact">
									<tr>
										<td><c:out value="${contact.id_contact }" /></td>
										<td><c:out value="${contact.sujet }" /></td>
										<td><c:out value="${contact.message }" /></td>
										<td><c:out value="${contact.etat }" /></td>

									</tr>
								</c:forEach>
								<tr>
							</tbody>
						</table>
					</div>
				</div>

			</div>



		</section>
	</div>

</body>
</html>