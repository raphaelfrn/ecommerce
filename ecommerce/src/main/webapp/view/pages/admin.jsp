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
<link href="css/header/header.css" rel="stylesheet">
<link href="css/footer/footer.css" rel="stylesheet">
<link href="css/modals/modal-connexion.css" rel="stylesheet">
<link href="css/modals/modal-inscription.css" rel="stylesheet">
<link href="css/pages/admin.css" rel="stylesheet">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

<script type="text/javascript" defer src="js/admin.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.9.1/chart.min.js"></script>

<title>Admin</title>
</head>
<body>
	
	<div class="container-page-admin">
		<section class="container-admin-menu" >
			<div class="container-logo-admin"><img class="logo-dione-admin" alt="logo Dione" src="assets/logo/logo-admin.svg"></div>
			<ul class="container-admin-menu-ul">
				<li class="admin-link-dashbord"> <img alt="Icon tableau de bord" src="assets/icon/icon-admin-dashbord.svg">Tableau de bord</li>
				<li class="admin-link-users"> <img alt="Icon clients" src="assets/icon/icon-admin-users.svg"> Clients</li>
				<li class="admin-link-add"> <img alt="Icon ajouter" src="assets/icon/icon-admin-add.svg"> Add</li>
			</ul>
		</section>
		
		<section class="container-admin">
			<section class="container-admin-dashbord">
				<div class="container-admin-dashbord-charts">
					<div class="content-admin-dashbord-charts">
						<div class="container-sales">
							<article class="container-total-sales container-total-sales-years">
								<div class="container-infos"><h1>CA annuel</h1></div>
								<p class="total-CA">455000 €</p>
							</article>
							<article class="container-total-sales container-total-sales-month">
								<div class="container-infos"><h1>CA mensuel</h1><p><span>+</span>25<span>%</span></p></div>
								<p class="total-CA">395349 €</p>
							</article>

						</div>
						<div class="container-leader-visites">
							<article class="container-leader-product">
								<div class="container-infos"><h1>Produit Phare</h1></div>
								<p><span>+</span>25000 €</p>
								<div class="container-leader-product-img"><img alt="Image produit leader" src="assets/img/enceintes/Phantom-1/Phantom-1-Black300x300.webp"></div>
								<h1 class="leader-product">Phantom I Black</h1>
							</article>
							<article class="container-chart-visite">
								<div class="container-infos container-chart-infos"><h1>Visites</h1> <p>Nbr de visites: <span>18850</span> </p> </div>
								<canvas id="chartVisite" aria-label="chart" role="img" ></canvas>
							</article>
						</div>
					</div>

					<article class="container-chart-categories">
						<div class="container-infos container-chart-infos"><h1>Categories</h1><span>CA par categorie</span></div>
						<canvas id="chartCategories" aria-label="chart" role="img" ></canvas>
					</article>
				</div>
	
				<article class="container-last-clients">
					<div class="container-infos"><h1>Nbr de clients : ${listUserNnbr}</h1><p><span>+</span>160<span></span></p></div>
						<c:forEach items="${listUsersLastRegister}" var="listUsersLastRegister">
							<div class="container-clients">
								<div class="container-clients-infos"> 
									<img class="admin-icon-user" alt="Icon client" src=""> 
									<p class="clients1">${listUsersLastRegister.nom} ${listUsersLastRegister.prenom}</p>
								</div>
								<div class="container-clients-infos"> 
									<img class="admin-icon-mail" alt="Icon client" src="">  
									<p class="clients1">${listUsersLastRegister.email}</p>
								</div>
								<div class="container-clients-infos"> 
									<img class="admin-icon-phone"  alt="Icon client" src=""> 
									<p class="clients1">${listUsersLastRegister.telephone}</p>
								</div>
								<div class="container-clients-infos"> 
									<p class="clients1">inscrit le : ${listUsersLastRegister.date_inscription}</p>
								</div>
							</div>
					</c:forEach>
				</article>
					
				<div class="container-comments-search">
				
					<article class="container-chart-search">
						<div class="container-infos container-chart-infos"><h1>Produits les <span>+</span> recherchés</h1></div>
						<canvas id="chartSearch" aria-label="chart" role="img" ></canvas>
					</article>
					
					<article class="container-contact">
						<div class="container-infos"><h1>Contact</h1><p><span>+</span>${NbrContactNotRead} demandes non lu</p></div>
						<div class="container-admin-commments">
							 <c:forEach items="${listLastContact}" var="listLastContact">
								<div class="container-comment-infos"> <img class="admin-icon-contact"  alt="Icon commentaire" src="assets/icon/comment1.svg"> <p class="admin-comment">${listLastContact.id_utilisateur.nom} ${listLastContact.id_utilisateur.prenom}, ${listLastContact.message} </p></div>
						</c:forEach>
							
						</div>
						<button>Voir toutes les demandes</button>
					</article>
					
					<article class="container-comments">
						<div class="container-infos"><h1>Commentaires</h1><p><span>+</span>10 commentaires</p></div>
						<div class="container-admin-commments">
							<div class="container-comment-infos"> <img class="admin-icon-comment" alt="Icon commentaire" src="assets/icon/comment1.svg"> <p class="admin-comment">Dupont Marc, Commentaire renseignement </p></div>
							<div class="container-comment-infos"> <img class="admin-icon-comment" alt="Icon commentaire" src="assets/icon/comment2.svg"> <p class="admin-comment">Dupont Marc, Commentaire renseignement lkkldsjkldsjvkdfvkjdsjkv v, bvjdfbvjdbsfnvjd  </p></div>
							<div class="container-comment-infos"> <img class="admin-icon-comment" alt="Icon commentaire" src="assets/icon/comment3.svg"> <p class="admin-comment">Dupont Marc, Commentaire renseignement klnvkjfd vjhdbvjh vjhdbjhs cjhdsbcsdl cjlsd clhjds cjds </p></div>
						</div>
						<button>Voir tous les commentaires</button>
					</article>
				</div>
			</section>
			
			<section  class="container-admin-users">
				<h1>Coucou Client</h1>
			</section>
			
			<section  class="container-admin-add">
				<div class="container-admin-add-row1">
					<div class="container-add-categories content-admin-add-row1">
						<div class="container-add-icon">
							 <img class="add-icon-cat" alt="Icons categorie" src="assets/icon/icons-add-cat.svg">
						</div>
						<div class="title-add-content"><h1>Catégorie</h1></div> 
						<div class="icon-add-content"><img alt="Icon d'ajout" src="assets/icon/icon-content-add.svg"></div>
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
	
	<section class="container-data-admin">
		<c:forEach items="${listUsers}" var="listUsers">
			<p class="data-name-user">${listUsers.nom}</p>
		</c:forEach>

		<c:forEach items="${listCat}" var="listCat">
			<p class="data-title-cat">${listCat.titre}</p>
		</c:forEach>

		<c:forEach items="${listSousCat}" var="listSousCat">
			<p class="data-title-sous-cat">${listSousCat.titre}</p>
		</c:forEach>

		<c:forEach items="${listProducts}" var="listProducts">
			<p class="data-title-products">${listProducts.titre}</p>
		</c:forEach>
		
		<c:forEach items="${listSearch}" var="listSearch">
			<p class="data-mot-cle-search">${listSearch.mot_cle}</p>
		</c:forEach>
		
		<c:forEach items="${listSearchCount}" var="listSearchCount">
			<p class="data-mot-cle-search-count">${listSearchCount}</p>
		</c:forEach>
	</section>
</body>
</html>