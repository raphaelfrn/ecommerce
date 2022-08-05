let sound = document.querySelector(".icon-sound");
let video = document.querySelector(".video-hero");

function disableMute() { 
	video.muted = !video.muted;
} 

sound.addEventListener('click', () => {
	disableMute();
})