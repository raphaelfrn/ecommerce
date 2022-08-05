<%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
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
<link href="css/footer/footer.css" rel="stylesheet">
<link href="css/modals/modal-connexion.css" rel="stylesheet">
<link href="css/modals/modal-inscription.css" rel="stylesheet">
<link href="css/pages/contact.css" rel="stylesheet">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

<script type="text/javascript" defer src="js/modal-connexion.js"></script>
<script type="text/javascript" defer src="js/modal-inscription.js"></script>
<script type="text/javascript" defer src="js/contact.js"></script>

<title>Contact</title>
</head>
<body>
	<c:import url="/header"></c:import>
	
	<% if((boolean)session.getAttribute("isConnected")==false){ %>
		<div class="container-need-user">
      		<h1>Veuillez vous connecter pour pouvoir envoyer votre demande de contact</h1>
         </div>
	<% }else{ %>
	<section class="container-contact">
		<article class="container-contact-form">
			<c:if test="${msgCreateContact}">
				<div class="alertValidateContact alertValidateContactYes alertTimeContact ">
		  			<p>Votre message a été envoyé</p>
				</div>
			</c:if>
			
			<c:if test="${msgCreateContact == false}">
				<div class="alertValidateContact alertValidateContactNo alertTimeContact ">
			  		<p>Votre message n'a pas pu être envoyé</p>
				</div>
			</c:if>
			  	<form method="post" action="" class="contact-form" onsubmit="return verifContact()">
					<input class="contact-sujet" type="text" id="sujet" name="sujet" value=""  placeholder="Sujet *" >
			   		<textarea class="contact-msg"  id="subject" name="msgContact" placeholder="Entrer votre message ..." minlength="10" maxlength="900" ></textarea>
					<input class="btn-contact" name="btnContact" type="submit" value="Valider" > 
					<p class="alerty-contact"></p>
			 	 </form>
		</article>
	</section>
	<% } %>	
	<section class="container-video-contact">
		<video class="video-contact" muted autoplay="autoplay" loop preload="auto">
			<source src="assets/video/contact_video.mp4" type="video/mp4">
		</video>
	</section>
	
	<c:import url="/view/footer/footer.jsp"></c:import>
</body>
</html>