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

<link href="css/pages/historique.css" rel="stylesheet">


<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script  src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

<title>Historique de commande</title>
</head>
<body>
	<c:import url="/header"></c:import>
	
	
	<div class="container-table">
	
	
			<div class="container-title"><h1>Historique de commande</h1></div>
			
			<div class="container-data">
			
				<table>
				
				<thead>
				<tr>
					<th>N° commande</th>
					<th>Date</th>
					<th>Total</th>
					<th>Show</th>
					<th>Facture</th>
				</tr>
				</thead>
			
				<tbody>
			
				<tr> 
					<td>23623</td>
					<td>18/06/2022</td>
					<td>2310€</td>
					<td><img src="assets/icon/show.svg" alt="show"></td>
					<td><img src="assets/icon/download.svg" alt="download"></td>
				</tr>
				
				<tr> 
					<td>27399</td>
					<td>18/06/2022</td>
					<td>2310€</td>
					<td><img src="assets/icon/show.svg" alt="show"></td>
					<td><img src="assets/icon/download.svg" alt="download"></td>
				
				
				</tr>
				
				<tr> 
					<td>27399</td>
					<td>18/06/2022</td>
					<td>2310€</td>
					<td><img src="assets/icon/show.svg" alt="show"></td>
					<td><img src="assets/icon/download.svg" alt="download"></td>
				
				
				</tr>
				
				
				
				</tbody>
				
				
				
				
				</table>
			
			</div>


	</div>




</body>
</html>