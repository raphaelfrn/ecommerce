const chartVisite = document.getElementById("chartVisite");
const chartCategories = document.getElementById("chartCategories");
const chartSearch = document.getElementById("chartSearch");

//Data
let data_sousCat = document.querySelectorAll(".data-title-sous-cat");
let data_product_title = document.querySelectorAll(".data-title-products");
let data_nbr_visit = document.querySelectorAll(".data-title-nbr-visit");
let data_cat = document.querySelectorAll(".data-title-cat");
let data_ca_by_cat = document.querySelectorAll(".data-Ca-by-cat");
let data_motCle = document.querySelectorAll(".data-mot-cle-search");
let data_motCle_count = document.querySelectorAll(".data-mot-cle-search-count");

// Icons foreach
let containerClients = document.querySelectorAll(".container-clients");
let adminIconUsers = document.querySelectorAll(".admin-icon-user");
let adminIconMail = document.querySelectorAll(".admin-icon-mail");
let adminIconPhone = document.querySelectorAll(".admin-icon-phone");
let adminIconContact = document.querySelectorAll(".admin-icon-contact")
let adminIconComment = document.querySelectorAll(".admin-icon-comment")

// Icons foreach
adminIconUsers.forEach(function(element,  index, arr){
	if (index == 0) {
		arr[index].src = "assets/icon/user-admin1.svg";
	} 
	else if (index == 1) {
		arr[index].src = "assets/icon/user-admin2.svg";
	} 
	else {
		arr[index].src = "assets/icon/user-admin3.svg";
	}	
})

adminIconMail.forEach(function(element,  index, arr){
	if (index == 0) {
		arr[index].src = "assets/icon/mail1.svg";
	} 
	else if (index == 1) {
		arr[index].src = "assets/icon/mail2.svg";
	} 
	else {
		arr[index].src = "assets/icon/mail3.svg";
	}	
})

adminIconPhone.forEach(function(element,  index, arr){
	if (index == 0) {
		arr[index].src = "assets/icon/phone1.svg";
	} 
	else if (index == 1) {
		arr[index].src = "assets/icon/phone2.svg";
	} 
	else {
		arr[index].src = "assets/icon/phone3.svg";
	}	
})

adminIconContact.forEach(function(element,  index, arr){
	if (index == 0) {
		arr[index].src = "assets/icon/contact1.svg";
	} 
	else if (index == 1) {
		arr[index].src = "assets/icon/contact2.svg";
	} else {
		arr[index].src = "assets/icon/contact3.svg";
	}	
})

adminIconComment.forEach(function(element,  index, arr){
	if (index == 0) {
		arr[index].src = "assets/icon/comment1.svg";
	} 
	else if (index == 1) {
		arr[index].src = "assets/icon/comment2.svg";
	} else {
		arr[index].src = "assets/icon/comment3.svg";
	}	
})



// Graphique visite
let arrayTitleProd = [];
data_product_title.forEach(function(element){
	arrayTitleProd.push(element.textContent);
})

let arrayNbrVisit = [];
data_nbr_visit.forEach(function(element){
	arrayNbrVisit.push(element.textContent);
}) 
console.log(arrayNbrVisit)

const  visiteChart = new Chart(chartVisite, {
	type: "bar",
	data: {
		labels: arrayTitleProd,
		datasets: [{
			data:arrayNbrVisit,
			
		backgroundColor: [
						'#c2bc97',
						'#c8ccb2',
						'#132738',
						'#214e4e',
						'#377f74'
		],
            borderWidth: 1
		}]
	},
	options: {
		plugins: { 
			legend: { 
				display: false 
			}
		},
		scales: {
			y: { 
//				suggestedMax: 600,
				grid: {
					display: false 
				},
				ticks: {
					font: {
						size: 9
					}
				}
			 }, 
			x: { 
				grid: { 
					display: false 
				},
				
				ticks: {
					font: {
						size: 0
					}
				}
			 }
		}
	}
})

//Graphique Categories

let arrayCat = [];
data_cat.forEach(function(element){
	arrayCat.push(element.textContent);
})

let arrayCaByCat= [];
data_ca_by_cat.forEach(function(element){
	arrayCaByCat.push(element.textContent);
})

const dataCat = {
  labels: arrayCat,
  datasets: [{
    data: arrayCaByCat,
    backgroundColor: [
			'#000807',
			'#051c1b',
			'#243b2a',
			'#485e3a',
			'#7b883f'
    ],
    
    hoverOffset: 4
  }]
};
const  catChart = new Chart(chartCategories, {
	type: "pie",
	data: dataCat,
	options: {

	}
})



// Graphique recherche

let arrayCountSearch = [];
data_motCle_count.forEach(function(element){
	arrayCountSearch.push(element.textContent);
})

let arrayMotCle = [];
data_motCle.forEach(function(element){
	arrayMotCle.push(element.textContent);
})

const dataSearch = {
  labels: arrayMotCle,
  datasets: [{
    data: arrayCountSearch,
    backgroundColor: [
			'#000807',
			'#051c1b',
			'#243b2a',
			'#485e3a',
			'#7b883f'
    ],
    
    hoverOffset: 4
  }]
};
const  searchChart = new Chart(chartSearch, {
	  type: 'doughnut',
	  data: dataSearch,
	options: {

	}
})


