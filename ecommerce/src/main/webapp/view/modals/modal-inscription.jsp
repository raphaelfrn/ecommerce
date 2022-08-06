<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="background-modal-inscription">
	<div class="container-modal-inscription">
		<div class="container-icon-close-inscription">
			<img class="icon-close-inscription" alt="Icon fermer" src="assets/icon/close.svg">
		</div>		
		<div class="content-modal-inscription">
			<form method="post" class="modal-inscription-form" onsubmit="return verif()"  >
				<div class="container-inscription">
					<h1 class="modal-inscription-title">Inscription ${name}</h1>
					
						<div class="container-modal-inscription-input">
						
						<div class="row-input-inscription">
							<input class="register-input-txt" type="text" id="name" name="name" value=""  placeholder="Nom *" >
						
							<input class="register-input-txt"  type="text" id="firstname" name="firstname" value="" placeholder="Prénom *" > 
						</div>
						
							<div><input type="text" id="email" name="email" value="" placeholder="Email *" ></div>
							
							<div><input type="text" id="address" name="address" value="" placeholder="Adresse *" ></div>
						
						<div class="row-input-inscription">
							<input class="register-input-txt" type="text" id="city" name="city" value="" placeholder="Ville *" >
							<input type="number" id="zipCode" name="zipCode" value="" placeholder="Code Postal *" >
						</div>
						
						<div class="row-input-inscription">
							<input class="register-input-txt" type="text" id="country" name="country" value="" placeholder="Pays *" >
							<input type="number" id="phone" name="phone" value="" placeholder="Téléphone *" >
						</div>
						
							<div><input class="pwd" type="password" id="password" name="password" placeholder="Mot de passe *" ></div>
						
							<div><input class="pwd" type="password" id="passwordConfirm" name="passwordConfirm" placeholder="Répéter votre mot de passe *" ></div>
							<div class="container-alerty"><p class="alerty"></p></div>
						</div>
						<div class="container-btn-inscription">
							<input name="btnInscription" class="btn-inscription" type="submit" value="Créer mon compte" > 
						</div>
				</div>
			</form>
		</div>
	</div>	
</div>

<c:if test="${msgUser}">
	<div class="confirm-register confirm-registerOK">
		<p>Votre compte à bien été créer, merci de vous connecter</p>
	</div>
</c:if>

<c:if test="${msgRegisterNo}">
	<div class="confirm-register confirm-registerNo">
		<p>Votre compte existe déjà, veuillez vous connecter ou créer un nouveau compte.</p>
	</div>
</c:if>