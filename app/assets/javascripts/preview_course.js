window.addEventListener("load", function() {
    document.getElementById("course_avatar").addEventListener('change', preview);
});

function preview() {
    var output = document.getElementById('preview');
    output.src = URL.createObjectURL(event.target.files[0]);
}