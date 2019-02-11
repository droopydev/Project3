window.addEventListener("load", function() {
    document.getElementById("filterlocationbtn").addEventListener('click', openForm);
    document.getElementById("filterlocationsubmit").addEventListener('click', scanForm);
    document.getElementById("resetfilter").addEventListener('click', reset);
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
    document.querySelectorAll(".filterlocation").forEach(function(eachCheckbox){
        if (eachCheckbox.checked) {
            values.push(eachCheckbox.value);
        }    
    })
    
    if (values.length  > 0) {
        filterDisplay(values);
    }
 }

 function filterDisplay(array) {
     console.log(array);
     var allCards = document.querySelectorAll(".card")
     allCards.forEach(function(eachCard){
         if (!array.includes(eachCard.children[1].children[1].children[0].textContent.replace(/\s/g,''))){
             eachCard.style.display = "none";
         } else {
             eachCard.style.display ="";
         }
     })
 }

 function reset() {
    var allCards = document.querySelectorAll(".card")
    allCards.forEach(function(eachCard){
        eachCard.style.display = "";
    })
 }