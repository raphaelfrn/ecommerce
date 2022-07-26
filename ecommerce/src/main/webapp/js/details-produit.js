let CommentsBtn = document.querySelector(".comments");
let CommentsPanel = document.querySelector(".container-comments");

CommentsPanel.style.display="none";

CommentsBtn.addEventListener("click", () => {
	
CommentsPanel.style.display == "none" ? CommentsPanel.style.display = "flex" : CommentsPanel.style.display = "none";

});