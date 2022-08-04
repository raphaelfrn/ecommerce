let sound = document.querySelector(".icon-sound");
let video = document.querySelector(".video-hero");

function disableMute() { 
	video.muted = !video.muted;
	!video.muted == video.muted ;
	
//		sound.forEach(function(element, index, arr){
//		arr[index].muted = !arr[index].muted;
//		
//	})
} 

sound.addEventListener('click', () => {
	disableMute();
})