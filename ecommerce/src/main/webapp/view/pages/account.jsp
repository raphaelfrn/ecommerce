<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html> 
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="format-detection" content="telephone=no">

<link rel="icon" href="assets/logo/favicon.ico" type="image/x-icon">
<link href="css/_reset.css" rel="stylesheet" type="text/css">
<link href="assets/font/font.css" rel="stylesheet">
<link href="css/header/header.css" rel="stylesheet">
<link href="css/pages/account.css" rel="stylesheet">
<link href="css/modals/modal-update.css" rel="stylesheet">
<link href="css/modals/modal-connexion.css" rel="stylesheet">
<link href="css/modals/modal-inscription.css" rel="stylesheet">

<script type="text/javascript" defer src="js/modal-connexion.js"></script>
<script type="text/javascript" defer src="js/modal-update.js"></script>
<script type="text/javascript" defer src="js/modal-inscription.js"></script>
<script type="text/javascript" defer src="js/alert-timeout.js"></script>


<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

<title>Compte</title>
</head>
<body>
	<c:url value="/address" var="address"/>
	<c:url value="/historique" var="historique"/>
	<c:url value="/account" var="account"/>
	<c:url value="/deconnexion" var="deconnexion"/>
	<c:url value="/detailsCommand" var="details"/>
	
		<c:import url="/modalUpdate"></c:import>
		<c:import url="/header"></c:import>
		<c:if test="${msgUpdatPwd}">
			<div class="alertValidatePwd alertValidatePwdYes alertTimePwd ">
			 		<p>Votre mot de passe a été modifier</p>
			</div>
		</c:if>
			
		<c:if test="${msgUpdatPwd == false}">
			<div class="alertValidatePwd alertValidatePwdNo alertTimePwd ">
		  		<p>Votre mot de passe n'a pas pu être modifier, veuillez réessayer</p>
			</div>
		</c:if>
				
		<c:if test="${msgPwdNo}">
			<div class="alertValidatePwd alertValidatePwdNo alertTimePwd ">
				 <p>Votre mot de passe n'a pas pu être modifier, veuillez réessayer</p>
			</div>
		</c:if>
	
		<div class="container-account">
			<div class="container-clients">
				<div class="container-infos-client-first">
					<h1 class="infos-client-title">Vos informations</h1>
					<a href="${deconnexion}"> <span class="infos-client-span">Me déconnecter</span></a>
				</div>
				
				<div class="container-client">
					<div class="container-infos-client">
						<p>${InfosUser.nom} ${InfosUser.prenom}</p>
						<span class="update-fullname">Modifier</span>
					</div>
					<div class="container-infos-client">
						<p>${InfosUser.email}</p>
						<span class="update-mail">Modifier</span>
					</div>
				</div>
						
				<c:forEach items="${listAddress }" var="addressUser" varStatus="status">	
					<c:if test="${status.first }">
						<div class="container-client">
							<h1>Adresse</h1>
							<div class="container-infos-client">
								<p>${addressUser.adresse}</p>
								<a href="${address}"><img class="icon-arrow update-address" alt="Icon flêche" src="assets/icon/arrow.svg"></a>
							</div>
							<p>${addressUser.code_postal} ${addressUser.ville}, ${addressUser.pays}</p>
						</div>
					</c:if>	
				</c:forEach>
				
				<div class="container-client">
					<div class="container-infos-client">
						<h1>Téléphone</h1>
						<span class="update-phone">Modifier</span>
					</div>
					<p>${InfosUser.telephone}</p>
				</div>
				
				<div class="container-infos-client">
					<p>Mot de passe *******</p>
					<span class="update-pwd">Modifier</span>
				</div>
			</div>
			

			
			<div class="container-command">
				<div class="container-last-order">
				<c:forEach items="${lastCommand}" var="last">
					<h1>Votre dernier achat</h1>
					<div class="container-last-order-infos">
					
						<p><c:out value="${last.dateC }" /></p>
						<div>
							<span><c:out value="${last.total }" /> €</span>
							<a href="${details}?idC=${last.id_commande}">Voir la commande</a>
						</div>
					</div>
					
					<div class="container-last-order-img">
				 <c:forEach items="${listeImage}" var="listeImage"> 
						<img alt="Image produit" src="<c:out value="${listeImage.id_produit.image }" />">
					 </c:forEach> 
					</div>
					
				</c:forEach>	
				</div>
				<a class="title-order-history" href="${historique}">Historique de commande</a>
			</div>
		</div>
</body>
</html>