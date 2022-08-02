<div class="background-modal">
	<div class="container-modal-add">
		<div class="container-icon-close">
			<img class="icon-close-add" alt="Icon fermer" src="assets/icon/close.svg">
		</div>
		<div class="content-modal">
			<h1 class="title-modal-add">Ajouter une nouvelle adresse de livraison</h1>
			<form method="post" onsubmit="return verifAddressModal()">
				<div class="container-input-modal-add ">
					<input type="text" id="modalAddressStreet" name="address" placeholder="Adresse" >
					<input class="address-input-txt-only" type="text" id="modalCity" name="city" placeholder="Ville" >
					<input type="text" id="modalAdressZipCode" name="zipCode" placeholder="Code Postal" >
					<input class="address-input-txt-only" type="text" id="modalCountry" name="country" placeholder="Pays" >
					<div class="container-alerty-modal-address"><p class="alerty-modal-address"></p></div>
				</div>
				<div class="container-btn-modal-add">
					<a><button class="btn-modal-add" name="btnAddModalAddress">Ajouter</button></a>
				</div>
			</form>
		</div>
	</div>
</div> 