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
						<div class="icon-add-content"><img class="admin-icon-display-add" alt="Icon d'ajout" src="assets/icon/icon-content-add.svg"></div>
						<form method="post" class="admin-form-add-cat">
							<input class="admin-input-add" type="text" id="add-title-cat" name="addTitleCat" value=""  placeholder="Titre *" >
							<input class="admin-input-add" type="text" id="add-video-cat" name="addVideoCat" value=""  placeholder="Video *" >
							<input class="admin-input-add" type="text" id="add-description-cat" name="addDescriptionCat" value=""  placeholder="Descrription *" >
							<input class="admin-input-add" type="text" id="add-img-cat" name="addImgCat" value=""  placeholder="Image*" >
							<div class="icon-add-content">
								<button type="submit" class="admin-btn-add" name="addCat"><img alt="Icon d'ajout" src="assets/icon/icon-content-add.svg"></button>
							</div>
						</form>
					</div>
					<div class="container-add-subcategories content-admin-add-row1">
						<div class="container-add-icon">
							<img class="add-icon-subcat" alt="Icons sous categorie" src="assets/icon/icons-add-subcat.svg">	
						</div>	
						<div class="title-add-content"><h1>Sous catégorie</h1></div> 
						<div class="icon-add-content"><img alt="Icon d'ajout" src="assets/icon/icon-content-add.svg"></div>
					</div>
					<div class="container-add-products content-admin-add-row1">
						<div class="container-add-icon">
							 <img class="add-icon-product" alt="Icon produits" src="assets/icon/icon-add-product.svg">
						</div>
						<div class="title-add-content"><h1>Produit</h1></div> 
						<div class="icon-add-content"><img alt="Icon d'ajout" src="assets/icon/icon-content-add.svg"></div>
					</div>
				</div>
			</section>
		</section>
	</div>
</body>
</html>