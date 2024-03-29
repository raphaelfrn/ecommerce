<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
    
<!DOCTYPE html>
<html> 
<head>
<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<link rel="icon" href="assets/logo/favicon.ico" type="image/x-icon">
<link href="css/_reset.css" rel="stylesheet" type="text/css">
<link href="assets/font/font.css" rel="stylesheet">
<link href="css/header/header.css" rel="stylesheet">
<link href="css/footer/footer.css" rel="stylesheet">
<link href="css/pages/sous-categories.css" rel="stylesheet">
<link href="css/modals/modal-connexion.css" rel="stylesheet">
<link href="css/modals/modal-inscription.css" rel="stylesheet">


<script type="text/javascript" defer src="js/modal-connexion.js"></script>
<script type="text/javascript" defer src="js/modal-inscription.js"></script>
<script type="text/javascript" defer src="js/muted-video.js"></script>


<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

<title>Sous Catégories</title>
</head>

<body>
	<c:url value="/details" var="details"/>
	<c:url value="/produits" var="produits"/>
	
	<c:import url="/header"></c:import>	
	
	<div class="container-hero">
		
		<c:set var="url" value="${categorie.video }"/>
		<c:if test="${fn:contains(url,'mp4')}" >
		
			<video class="video-hero" muted autoplay="autoplay" loop preload="auto">
	         	 <source src="<c:out value="${categorie.video }" /> " type="video/mp4">
        	</video>
			<div class="container-hero-infos">
				<img class="icon-sound" alt="Icon son" src="assets/icon/sound.svg">
			</div> 
		
		</c:if>
			
		<c:if test="${fn:contains(url,'webp')}">
		<div class="image-hero"> <img alt="hero image" src="<c:out value="${categorie.video }"/>"> </div>
		</c:if>	
	
	
		
	</div>
	
	<div class="container-categories">
	<c:forEach items="${listSousCat }" var="sousCat">
	
	
		<div class="container-categorie">
			<img alt="Image produits de la catégorie ..." src="<c:out value="${sousCat.image }" />">
			<h1><c:out value="${sousCat.titre }" /> </h1>	
			<div class="container-categorie-btn">
			<a href="${produits}?idSousCat=${sousCat.id_sous_categorie}"><button name="btn-sous-cat"  class="btn-categorie-show">Découvrir</button></a>	
			</div>	
		</div>

	</c:forEach>
	</div>

	<c:import url="/view/footer/footer.jsp"></c:import>
</body>
</html>