// Get the modal and the image
const modal = document.getElementById('fullscreenModal');
const fullscreenImage = document.getElementById('fullscreenImage');
const closeBtn = document.getElementById('closeFullscreen');

// Get all preview images
const images = document.querySelectorAll('.preview-image');

// Add click event to each image for fullscreen
images.forEach(image => {
  image.addEventListener('click', () => {
    fullscreenImage.src = image.src; // Set the modal image source to the clicked image
    modal.style.display = 'flex'; // Show the modal
  });
});

// Add click event to the close button to close the modal
closeBtn.addEventListener('click', () => {
  modal.style.display = 'none'; // Hide the modal
});

// Close modal if the background (outside the image) is clicked
modal.addEventListener('click', (e) => {
  if (e.target === modal) {
    modal.style.display = 'none'; // Hide the modal if the background is clicked
  }
});
