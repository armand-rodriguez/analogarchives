// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//

//= require rails-ujs
//= require activestorage
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .


// -------------------------- NAVBAR BURGER EXPANSION -----------------------
// document.addEventListener('DOMContentLoaded', () => {
//
//   // Get all "navbar-burger" elements
//   const $navbarBurgers = Array.prototype.slice.call(document.querySelectorAll(".navbar-burger"), 0);
//
//   // Check if there are any navbar burgers
//   if ($navbarBurgers.length > 0) {
//
//     // Add a click event on each of them
//     $navbarBurgers.forEach( el => {
//       el.addEventListener('click', () => {
//
//         // Get the target from the "data-target" attribute
//         const target = el.dataset.target;
//         const $target = document.getElementById("navMenu");
//
//         // Toggle the "is-active" class on both the "navbar-burger" and the "navbar-menu"
//         el.classList.toggle('is-active');
//         $target.classList.toggle('is-active');
//
//       });
//     });
//   }
//
// });



// $(document).ready(function() {
//
//   // Check for click events on the navbar burger icon
//   $(".navbar-burger").click(function() {
//
//       // Toggle the "is-active" class on both the "navbar-burger" and the "navbar-menu"
//       $(".navbar-burger").toggleClass("is-active");
//       $(".navbar-menu").toggleClass("is-active");
//
//   });
// });



//----------------------- FADE OUT ---------------------------//
window.onload = function() {
  window.setTimeout(fadeout, 8000);
}

function fadeout() {
  // document.getElementById("notification1").style.display = 'none';
  let notifications = document.getElementsByClassName("global-notification");
  for (let i = 0; i < notifications.length; i++ ) {
    notifications[i].style.display = 'none';
  }
}

document.get
