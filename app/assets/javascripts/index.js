window.onload = function() {
    // add event listener to filter button
    document.getElementById("filteragebtn").addEventListener('click', openForm)
    document.getElementById("filtercatbtn").addEventListener('click', openForm)
}


document.addEventListener('DOMContentLoaded', function() {
    // remove devise_error_message default formatting
    var error = document.getElementById("error_explanation");
    
    error.removeChild(error.firstChild);
    error.removeChild(error.firstChild);

    
}, false);


function openForm() {
    console.log(this.style)
   this.nextElementSibling.style.display = "block";
   this.removeEventListener('click', openForm);
   this.addEventListener('click', closeForm);
 }
 
 function closeForm() {
   this.nextElementSibling.style.display = "none";
   this.removeEventListener('click', closeForm);
   this.addEventListener('click', openForm);

 }