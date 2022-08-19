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
<link href="css/admin/admin-add.css" rel="stylesheet">

<script type="text/javascript" defer src="js/admin/admin-add.js"></script>
<script type="text/javascript" defer src="js/alert-timeout.js"></script>
  
<title>Ajout rapide</title>
</head>
<body>

	<div class="container-page-admin">
		<c:import url="admin-menu.jsp"></c:import>
		
		<section class="container-admin">	
			<section  class="container-admin-add">
				<div class="container-admin-add-row1">
					<div class="container-add-categories content-admin-add-row1">
						<div class="container-add-icon">
							 <img class="add-icon-cat" alt="Icons categorie" src="assets/icon/icons-add-cat.svg">
						</div>
						<div class="title-add-content"><h1>Catégorie</h1></div> 
						<div class="icon-add-content"><img class="admin-icon-display-add admin-icon-display-add-cat" alt="Icon d'ajout" src="assets/icon/icon-content-add.svg"></div>
						<c:if test="${Catmsg}">
							<div class="alert-msg-add alertAddmsg">
								<p>L'ajout a bien été pris en compte</p>
							</div>
						</c:if>
						<c:if test="${CatmsgNo}">
							<div class="alert-msg-add alertNoAddmsg">
								<p>Veuillez remplir tous les champs</p>
							</div>
						</c:if>
						
						<form method="post" class="admin-form-add-cat" autocomplete="off">
							<input class="admin-input-add" type="text" id="add-title-cat" name="addTitleCat" value=""  placeholder="Titre *" >
							<input class="admin-input-add" type="text" id="add-video-cat" name="addVideoCat" value=""  placeholder="Video *" >
							<input class="admin-input-add" type="text" id="add-description-cat" name="addDescriptionCat" value=""  placeholder="Descrription *" >
							<input class="admin-input-add" type="text" id="add-img-cat" name="addImgCat" value=""  placeholder="Image*" >
							<div class="icon-add-content">
								<button type="submit" class="admin-btn-add admin-btn-add-cat" name="addCat"><img alt="Icon d'ajout" src="assets/icon/icon-content-add.svg"></button>
							</div>
						</form>
					</div>
					<div class="container-add-subcategories content-admin-add-row1">
						<div class="container-add-icon">
							<img class="add-icon-subcat" alt="Icons sous categorie" src="assets/icon/icons-add-subcat.svg">	
						</div>	
						<div class="title-add-content"><h1>Sous catégorie</h1></div> 
						<div class="icon-add-content"><img class="admin-icon-display-add admin-icon-display-add-subcat" alt="Icon d'ajout" src="assets/icon/icon-content-add.svg"></div>
						
						<c:if test="${SubCatmsg}">
							<div class="alert-msg-add alertAddmsg">
								<p>L'ajout a bien été pris en compte</p>
							</div>
						</c:if>
						<c:if test="${SubCatmsgNo}">
							<div class="alert-msg-add alertNoAddmsg">
								<p>Veuillez remplir tous les champs</p>
							</div>
						</c:if>	
						<form method="post" class="admin-form-add-subcategories" autocomplete="off">
					 		<select class="select-add-csp" name="catSelected" id="catSelected">
					 			<option value="">-- Categories --</option>
					 			<c:if test="${!empty listCategories}">
							 		<c:forEach items="${listCategories}" var="listCat">
									    <option value="${listCat.id_categorie}">${listCat.titre}</option>
									</c:forEach>
								</c:if>
							</select>

							<input class="admin-input-add" type="text" id="add-title-subcat" name="addTitleSubCat" value=""  placeholder="Titre *" >
							<input class="admin-input-add" type="text" id="add-img-subcat" name="addImgSubCat" value=""  placeholder="Image*" >
							<input class="admin-input-add" type="text" id="add-video-subcat" name="addVideoSubCat" value=""  placeholder="Video *" >
							<div class="icon-add-content">
								<button type="submit" class="admin-btn-add admin-btn-add-subcat" name="addSubCat"><img alt="Icon d'ajout" src="assets/icon/icon-content-add.svg"></button>
							</div>
						</form>
						
					</div>
					<div class="container-add-products content-admin-add-row1">
						<div class="container-add-icon">
							 <img class="add-icon-product" alt="Icon produits" src="assets/icon/icon-add-product.svg">
						</div>
						<div class="title-add-content"><h1>Produit</h1></div> 
						<div class="icon-add-content"><img class="admin-icon-display-add admin-icon-display-add-prod" alt="Icon d'ajout" src="assets/icon/icon-content-add.svg"></div>
						
						<c:if test="${prodMsg}">
							<div class="alert-msg-add alertAddmsg">
								<p>L'ajout a bien été pris en compte</p>
							</div>
						</c:if>
						<c:if test="${prodMsgNo}">
							<div class="alert-msg-add alertNoAddmsg">
								<p>Veuillez remplir tous les champs</p>
							</div>
						</c:if>	
						<form method="post" class="admin-form-add-products" autocomplete="off">
							<select class="select-add-csp" name="subCatSelected" id="subCatSelected">
					 			<option value="">-- Sous categories --</option>
					 			<c:if test="${!empty listSubCategories}">
							 		<c:forEach items="${listSubCategories}" var="listSubCat">
									    <option value="${listSubCat.id_sous_categorie}">${listSubCat.titre}</option>
									</c:forEach>
								</c:if>
							</select>
							<input class="admin-input-add" type="text" id="add-title-prod" name="addTitleProduct" value=""  placeholder="Titre *" >
							<input class="admin-input-add" type="text" id="add-description-prod" name="addDescriptionProduct" value=""  placeholder="Descrription *" >
							<input class="admin-input-add" type="text" id="add-price-prod" name="addPriceProduct" value=""  placeholder="Prix *" >
							<input class="admin-input-add" type="text" id="add-img-prod" name="addImgProduct" value=""  placeholder="Image *" >
							<input class="admin-input-add" type="text" id="add-stock-prod" name="addStockProduct" value=""  placeholder="Stock *" >
							<input class="admin-input-add" type="text" id="add-stock-min-prod" name="addStockMinProduct" value=""  placeholder="Stock minimum*" >
							<div class="icon-add-content">
								<button type="submit" class="admin-btn-add admin-btn-add-prod" name="addProduct"><img alt="Icon d'ajout" src="assets/icon/icon-content-add.svg"></button>
							</div>
						</form>
					</div>
				</div>
			</section>
			

			<section class="continer-add-slider">
				<div class="container-add-slide">
					<div class="container-title-slides">
						<h1>Add</h1>
					</div>
					<form method="post" class="form-add-slide container-form-slide-input">
						<input class="" type="text" id="" name="addTitleSlide" value=""  placeholder="Titre *" >
						<input class="" type="text" id="" name="addSubTitlteSlide" value=""  placeholder="Sous-titre *" >
						<input class="" type="text" id="" name="addImgVideoSlide" value=""  placeholder="Image ou Video *" >
						<input class="" type="text" id="" name="addUrlSlide" value=""  placeholder="url *" >
						<button type="submit" class="btn-slide btn-slide-add" name="addSlide">Ajouter</button>
						<c:if test="${SlideMsg}">
							<div class="alert-msg-add alertAddmsg">
								<p>L'ajout a bien été pris en compte</p>
							</div>
						</c:if>
						<c:if test="${SlidemsgNo}">
							<div class="alert-msg-add alertNoAddmsg">
								<p>Veuillez remplir tous les champs</p>
							</div>
						</c:if>	
					</form>
				</div>
				
				<div class="container-carousel">
					<img class="icon-carousel" alt="Icon carousel" src="assets/icon/carousel.svg">
				</div>
				
				<div class="container-update-slide">
					<form method="post" class="form-update-slide container-form-slide-input">
						<select name="SlideSelectedUpdate" id="slides">
				 			<option value="">-- Slides --</option>
				 			<c:if test="${!empty listSlides}">
						 		<c:forEach items="${listSlides}" var="listSlides">
								    <option value="${listSlides.id_slides}">${listSlides.id_slides} -- ${listSlides.titre}</option>
								</c:forEach>
							</c:if>
						</select>
						<input class="" type="text" id="" name="updateTitleSlide" value=""  placeholder="Titre *" >
						<input class="" type="text" id="" name="updateSubTitlteSlide" value=""  placeholder="Sous-titre *" >
						<input class="" type="text" id="" name="updateImgVideoSlide" value=""  placeholder="Image ou Video *" >
						<input class="" type="text" id="" name="updateUrlSlide" value=""  placeholder="url *" >
						<button type="submit" class="btn-slide" name="updateSlide">Modifier</button>
						<c:if test="${SlideMsgUpdate}">
							<div class="alert-msg-add alertAddmsg">
								<p>Le slide a bien été modifié</p>
							</div>
						</c:if>
						<c:if test="${SlideUpdateNo}">
							<div class="alert-msg-add alertNoAddmsg">
								<p>Le slide n'a pas pu être modifié</p>
							</div>
						</c:if>	
					</form>
				</div>
				
				<div class="container-delete-slide">
					<div class="container-title-slides">
						<h1>Delete</h1>
					</div>
					<form method="post" class="form-delete-slide container-form-slide-input">
						<select name="SlideSelectedDelete" id="slides">
				 			<option value="">-- Slides --</option>
				 			<c:if test="${!empty listSlides}">
						 		<c:forEach items="${listSlides}" var="listSlides">
								    <option value="${listSlides.id_slides}">${listSlides.id_slides} -- ${listSlides.titre}</option>
								</c:forEach>
							</c:if>
						</select>
						<button type="submit" class="btn-slide" name="deleteSlide">Supprimer</button>
						<c:if test="${SlideMsgDelete}">
							<div class="alert-msg-add alertAddmsg">
								<p>Le slide a bien été supprimé</p>
							</div>
						</c:if>
						<c:if test="${SlidemsgNoDelete}">
							<div class="alert-msg-add alertNoAddmsg">
								<p>Le slide n'a pas pu être supprimé</p>
							</div>
						</c:if>	
					</form>
				</div>
			</section>
		</section>
	</div>
</body>
</html>