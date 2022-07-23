<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<link href="css/_reset.css" rel="stylesheet" type="text/css">
<link href="assets/font/font.css" rel="stylesheet">
<link href="css/header/header.css" rel="stylesheet">
<link href="css/footer/footer.css" rel="stylesheet">
<link href="css/pages/home.css" rel="stylesheet">
<link href="css/modals/modal-connexion.css" rel="stylesheet">
<script type="text/javascript" defer src="js/modal-connexion.js"></script>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

<title>Accueil</title>
</head>
<body>
	<c:import url="/header"></c:import>
	
	<div class="container-hero">
		<video class="video-hero" muted autoplay="autoplay" loop preload="auto">
	          <source src="assets/video/phantom-gold.mp4" type="video/mp4">
        </video>
		<div class="container-hero-infos">
			<div class="container-hero-title">
			 	<h2>Phantom</h2>
        		<h1>Le son libéré</h1>
			</div>
        		<button class="btn-hero">Découvrir</button>
		</div>
	</div>
	
	<div class="container-categorie">
		<div class="categorie">
			<div class="container-categorie-infos">
				<h1>Le son pur.</h1>
				<h1>Résolument nomade.</h1>
				<button> <span>Écouteurs</span> </button>
			</div>
			<img alt="Image écouteurs" src="assets/img/ecouteurs/ecouteurHome.png">
		</div>
		
		<div class="categorie-modifier">
			<div class="categories-modifier">
				<div class="container-categorie-infos container-categorie-infos-modifier">
					<h1>Une classe à part.</h1>
					<button> <span>Enceintes</span> </button>
				</div>
				<img alt="Image enceinte" src="assets/img/enceintes/enceinteHome.png">
			</div>
			
			<div class="categories-modifier">
				<div class="container-categorie-infos container-categorie-infos-modifier">
					<h1>Intensément immersive.</h1>
					<button> <span>Barre de son</span> </button>
				</div>
				<img alt="Image barre de son" src="assets/img/barre_de_son/barreHome.png">
			</div>
		</div>
		
		<div class="categorie">
			<div class="container-categorie-infos">
				<h1>Le système audiophile absolue.</h1>
				<button> <span>Amplificateur</span></button>
			</div>
			<img alt="Image amplificateur" src="assets/img/amplificateurs/amplificateurHome.png">
		</div>
	</div>
	
	<div class="container-infos-dione">
		<h1>Redécouvrez votre musique préféré</h1>
		<p>Dione a pour mission de redonner au son la place qu’il mérite dans nos vies,
		 en proposant des expériences d’écoute exceptionnelles quel que soit l'environnement ou le cas d'usage.
		  Le succès de l'entreprise repose sur une série d'innovations radicales intégrées dans tous les produits
		   Dione : les amplificateurs Expert Pro, les enceintes Phantom, les écouteurs sans fil Devialet Gemini
		    et la barre de son Devialet Dione. En associant une qualité sonore inégalée à un design raffiné et moderne,
		 les ingénieurs de Dione sont engagés dans la poursuite d'une exigence d'innovation hors du commun pour
		  repousser les limites de l'ingénierie du son.</p>
	</div>
	
	
	<c:import url="/view/footer/footer.jsp"></c:import>
</body>
</html>