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


<title>Clients</title>
</head>
<body>

	<div class="container-page-admin">

		<c:import url="admin-menu.jsp"></c:import>



		<section class="container-admin">

			<div class="container-infos-address">
				<div class="container-user-infos">
					<h1>Infos utilisateur</h1>

					<form method="post">
						<p>Id utilisateur : ${UserInfo.id_utilisateur}</p>
						<p>Nom et Prénom :</p>
						<input type="text" id="name" name="name" value="${UserInfo.nom }">
						<input type="text" id="prenom" name="prenom"
							value=" ${UserInfo.prenom }">
						<p>Date d'inscription : ${UserInfo.date_inscription }
						<p>Email :</p>
						<input type="text" id="email" name="email"
							value="${UserInfo.email }">
						<p>Telephone :</p>
						<input type="text" id="tel" name="tel"
							value="${UserInfo.telephone }">
						<button type="submit" name="btnUpdate">Modifier</button>

					</form>
				</div>

				<div class="container-user-address">
				<h1>Adresses</h1>
					<c:forEach items="${listAddress }" var="addressUser">	
						<div class="container-address">
							
							<p>${addressUser.adresse}</p>
							<p>${addressUser.code_postal} ${addressUser.ville}, ${addressUser.pays}</p>
						</div>
			   			
				</c:forEach>
				
				</div>

			</div>
			<div class="container-commands-details">
				<div class="container-commands">
					<h1>Commandes</h1>
					<table>
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
									<td><form method="post"><button type="submit" name="btnDetailsC" value="${commande.id_commande }"><img src="assets/icon/show.svg" alt="show"> </button></form></td>
								
								</tr>
							</c:forEach>
							<tr>
						</tbody>
					</table>
				</div>
				<div class="container-details">

					<h1>
						Commande n°
						<c:out value="${commande.id_commande }" />
						, Le
						<c:out value="${commande.dateC }" />
					</h1>



					<c:forEach items="${listDC }" var="DC">
						<div class="container-row-details-command">
							<img alt="Image produit"
								src="<c:out value="${DC.id_produit.image }" />">
							<div class="container-details-command">
								<div class="container-infos-product">
									<h1>
										<c:out value="${DC.id_produit.titre }" />
									</h1>
									<p>Feuille d'or</p>
								</div>
								<div class="container-price">
									<span><c:out value="${DC.quantite }" /></span>
									<p>
										<c:out value="${DC.prix }" />
										€
									</p>
								</div>
							</div>
						</div>
					</c:forEach>



					<div class="container-total">
						<p class="price-product">
							Total:
							<c:out value="${commande.total }" />
							€
						</p>

					</div>
				</div>

			</div>

			<div class="container-comm-contact">

				<div class="container-commentaires">
					<h1>Commentaires</h1>
					<table>
						<thead>
							<tr>
								<th>id commentaire</th>
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

				<div class="container-contact">
					<h1>Contact</h1>
					<table>
						<thead>
							<tr>
								<th>id contact</th>
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



		</section>
	</div>

</body>
</html>