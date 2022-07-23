<header class="container-header">
	<nav class="container-nav-header">	
		<div data-bs-toggle="offcanvas" data-bs-target="#offcanvasWithBothOptions" aria-controls="offcanvasWithBothOptions"><img class="icon-menu" alt="icon menu" src="assets/icon/menu.svg"></div>

		<a href="#"> <img class="logo-dione" alt="logo Dione" src="assets/logo/logo-dione-black.svg"> </a>
    
		<div class="container-icon">
			<form class="form-search" > <input class="input-search" type="text" placeholder="Rechercher" name="search"> </form>
			<a href=""><img class="icon icon-search" alt="Icon compte" src="assets/icon/search.svg"></a> 
			<a ><img class="icon icon-connexion" alt="Icon compte" src="assets/icon/account.svg"></a> 
			<a href=""><img class="icon" alt="Icon panier" src="assets/icon/basket.svg"></a>
		</div> 
	</nav>
	
	<div class="offcanvas offcanvas-start container-offcanvas" data-bs-scroll="true" tabindex="-1" id="offcanvasWithBothOptions" aria-labelledby="offcanvasWithBothOptionsLabel">
		<div class="offcanvas-header modal-header">
			<button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
		</div>
		<div class="offcanvas-body">
			<nav class="menu">
				<div class="content-menu">
					<a href="">Accueil</a>
					<a href="">Enceintes</a> 
					<a href="">Barre de son</a>
					<a href="">Ecouteurs</a> 
					<a href="">Amplificateurs</a>
				</div>
				<div class="content-account">
					<a href="">Mes informations</a> 
					<a href="">Mon histotique de commandes</a>
				</div>
			</nav>
	 	</div>
	</div>
	<c:import url="/modalConnexion"></c:import>
</header>


