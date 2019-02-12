window.addEventListener("load", function () {
    // remove devise_error_message default formatting
    document.getElementById("filtercatbtn").addEventListener('click', openForm);
    document.getElementById("filteragebtn").addEventListener('click', openForm);
    document.getElementById("filtercatsubmit").addEventListener('click', scanForm);
    document.getElementById("filteragesubmit").addEventListener('click', scanForm);
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

function reset() {
    var allCards = document.querySelectorAll(".card")
    allCards.forEach(function (eachCard) {
        eachCard.style.display = "";
    })
}

function scanForm() {
    var query;
    var values = [];
    if (this.id === "filteragesubmit") {
        query = ".filterage";
    } else {
        query = ".filtercat";
    }

    document.querySelectorAll(query).forEach(function (eachCheckbox) {
        if (eachCheckbox.checked) {
            values.push(eachCheckbox.value);
        }
    })

    if (values.length > 0) {
        filterDisplay(values, query);
    }

}

function filterDisplay(array, query) {
    console.log(array);
    var allCards = document.querySelectorAll(".card")
    allCards.forEach(function (eachCard) {
        if (query === ".filterage"){
            if (!array.includes(eachCard.children[1].children[1].children[0].textContent)) {
                eachCard.style.display = "none";
            }
        } else {
            if (!array.includes(eachCard.children[1].children[1].children[1].textContent.replace(/\s/g,''))) {
                eachCard.style.display = "none";
            }
        }
    })
}