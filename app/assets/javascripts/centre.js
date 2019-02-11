window.addEventListener("load", function() {
    document.getElementById("filterlocationbtn").addEventListener('click', openForm);
    document.getElementById("filterlocationsubmit").addEventListener('click', scanForm)
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

 function scanForm() {
    var values = [];
    var checkedboxes = document.querySelectorAll(".filterlocation").forEach(function(eachCheckbox){
        if (eachCheckbox.checked) {
            values.push(eachCheckbox.value);
        }    
    })
    console.log(values);
 }