function changeImage(input) {
    let file = input.files[0];

    let img = document.createElement("img");

    img.src = URL.createObjectURL(file);
    img.style.width = "100%";
    img.style.height = "100%";
    img.style.objectFit = "cover";

    let container = document.getElementById('image');
    container.innerHTML = "";
    container.appendChild(img);
}