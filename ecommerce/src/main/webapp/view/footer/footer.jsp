<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<footer class="container-footer">
	 <c:url value="/contact" var="contact"/>
	 
	<div class="container-footer-top">
		<p>Contacter nos conseillers <span>Lun au sam, 10.00-20.00</span></p>
		<button class="btn-phone">
			<img alt="icon tÃ©lÃ©phone" src="assets/icon/phone.svg">
			<p>+33  9 75 00 00 00</p>
		</button>
	</div>
	
	<div class="container-footer-body">
		<ul>
			<li><a href="">A propos</a></li>
			<li><a href="${contact}">Contact</a></li>
			<li><a href="">Assistance</a></li>
			<li><a href="">Boutique</a></li>
		</ul>
		<ul>
			<li><a href="">Professionnels</a></li>
			<li><a href="">Recrutement</a></li>
			<li><a href="">Reparation</a></li>
			<li class="container-media">
				<a href=""><img alt="icon Twitter" src="assets/icon/twitter.svg"></a>
				<a href=""><img alt="icon Facebook" src="assets/icon/facebook.svg"></a>
				<a href=""><img alt="icon Instagram" src="assets/icon/instagram.svg"></a>
			</li>
		</ul>
	</div>
	
	<div class="container-footer-bottom">
		<p>Copyright © 2022 Dione - Student project based on Devialet website</p>
	</div>
</footer>