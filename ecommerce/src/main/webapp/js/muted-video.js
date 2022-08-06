let sound = document.querySelector(".icon-sound");
let video = document.querySelector(".video-hero");

function disableMute() { 
	if (video != null) {
		video.muted = !video.muted;
	}
} 

if (sound != null ) {
	sound.addEventListener('click', () => {
	disableMute();
	})
}
