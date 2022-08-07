const chartVisite = document.getElementById("chartVisite");
const chartCategories = document.getElementById("chartCategories");
const chartSearch = document.getElementById("chartSearch");

let data_sousCat = document.querySelectorAll(".data-title-sous-cat");
let data_product_title = document.querySelectorAll(".data-title-products");
let data_cat = document.querySelectorAll(".data-title-cat");
let data_motCle = document.querySelectorAll(".data-mot-cle-search");
let data_motCle_count = document.querySelectorAll(".data-mot-cle-search-count");


// Graphique visite
let arrayNameUser = [];
data_product_title.forEach(function(element){
	arrayNameUser.push(element.textContent);
})

const  visiteChart = new Chart(chartVisite, {
	type: "bar",
	data: {
		labels: arrayNameUser,
		datasets: [{
			data: [250, 190, 400, 100, 20, 400, 134, 208, 167, 600, 52, 298, 67, 67, 567, 345,299,204, 600, 456, 324,56, 573,294,100, 78, 
			123, 343, 567, 89, 345, 209, 134, 58],
			
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
				suggestedMax: 600,
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

const dataCat = {
  labels: arrayCat,
  datasets: [{
    data: [20, 10, 16, 10],
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


