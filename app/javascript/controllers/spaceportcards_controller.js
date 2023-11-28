import { Controller } from "@hotwired/stimulus";

export default class extends Controller {

  //Loads the more detailed spaceport overlay
  // when user clicks on a spaceport 'card'
  showSpaceportDetails() {
    const spaceportId = this.element.dataset.spaceportId;
    
    document.querySelectorAll('.hidden-spaceport-details').forEach(function (element) {
      element.style.display = 'none';
    });
  
    const spaceportDetailsDiv = document.getElementById(`spaceportDetails_${spaceportId}`);
    spaceportDetailsDiv.style.display = 'flex';
  }

  // Hide all spaceport details divs
  // when user clicks on spaceport overlay background
  hideSpaceportDetails(event) {
    // Only hide if BACKGROUND is clicked, not the card itself
    if (event.target.classList.contains('hidden-spaceport-details') &&
        !event.target.classList.contains('spaceport-overlay-container')) {
      document.querySelectorAll('.hidden-spaceport-details').forEach(function (element) {
        element.style.display = 'none';
      });
    }
  }
}

/*
function initializeFunctions()
{
  const avatarThumbnailsFull = document.getElementById("avatar-thumbnails-full")
  const showAvatarsButton = document.getElementById("show-avatars");

  showAvatarsButton.addEventListener("click", () => {
    avatarThumbnailsFull.style.display = 'block';
  });

  avatarThumbnailsFull.addEventListener("click", () => {
    avatarThumbnailsFull.style.display = 'none';
  });

  document.querySelectorAll('.avatar-thumbnail-btn').forEach(button => {
    button.addEventListener('click', function() {
      // Adjust the value of the hidden field #avatar_path to match the .jpg file name
      document.getElementById('avatar-path').value = this.querySelector('img').id;
  
      // Hide the avatarThumbnails div
      avatarThumbnailsFull.style.display = 'none';
  
      // Update the main avatar image to match the selected image
      const selectedImage = this.querySelector('img').src;
      document.getElementById('avatar-thumbnail-main').src = selectedImage;
    });
  });

}

initializeFunctions();
document.addEventListener('turbo:render', function() { initializeFunctions(); });
*/