let CommentsBtn = document.querySelector(".comments");
let CommentsPanel = document.querySelector(".container-comments");

CommentsBtn.addEventListener("click", () => {
	
if	(CommentsPanel.style.display !== "none"){
	CommentsPanel.style.display = "none";
} else {
	CommentsPanel.style.display = "";
}
	
	});