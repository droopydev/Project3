window.addEventListener("load", function() {
    // remove devise_error_message default formatting
    document.getElementById("filtercatbtn").addEventListener('click', openForm);
    document.getElementById("filteragebtn").addEventListener('click', openForm);
});


function openForm() {
   this.nextElementSibling.style.display = "block";
   this.removeEventListener('click', openForm);
   this.addEventListener('click', closeForm);
 }
 
 function closeForm() {
   this.nextElementSibling.style.display = "none";
   this.removeEventListener('click', closeForm);
   this.addEventListener('click', openForm);

 }