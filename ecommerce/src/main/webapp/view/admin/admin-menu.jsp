<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<c:url value="/adminAdd" var="adminAdd"/>
<c:url value="/adminUser" var="adminUser"/>
<c:url value="/adminDashboard" var="adminDashboard"/>
<c:url value="/stocks_fournisseurs" var="stocks_fournisseurs"/>

<section class="container-admin-menu" >
	<div class="container-logo-admin"><img class="logo-dione-admin" alt="logo Dione" src="assets/logo/logo-admin.svg"></div>
	<ul class="container-admin-menu-ul">
		<li class="admin-link-dashbord"> <a href="${adminDashboard}"><img alt="Icon tableau de bord" src="assets/icon/icon-admin-dashbord.svg">Tableau de bord</a></li>
		<li class="admin-link-users"><a href="${adminUser}"><img alt="Icon clients" src="assets/icon/icon-admin-users.svg"> Clients</a></li>
		<li class="admin-link-add"><a href="${adminAdd}"><img alt="Icon ajouter" src="assets/icon/icon-admin-add.svg"> Add</a></li>
		<li class="admin-link-add"><a href="${stocks_fournisseurs}"><img alt="Icon stock" src="assets/icon/stock-menu.svg"> Stock / Suppliers</a></li>
	</ul>
</section>