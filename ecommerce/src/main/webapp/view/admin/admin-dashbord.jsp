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
<link href="css/admin/admin-dashbord.css" rel="stylesheet">

<script type="text/javascript" defer src="js/admin/admin-dashbord.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.9.1/chart.min.js"></script>


<title>Admin</title>
</head>
<body>
	
	<div class="container-page-admin">
		<c:import url="admin-menu.jsp"></c:import>
		
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