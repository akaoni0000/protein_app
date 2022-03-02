var displayImages = Array.from(document.getElementsByClassName("displayImages"));
displayImages[0].classList.add("border1");
displayImages.forEach((image) => {
    image.addEventListener("click", function(){
        let id = image.getAttribute('id');
        document.getElementById(`slide${id}`).click();

        displayImages.forEach((image) => {
            image.classList.remove("border1");
        });

        image.classList.add("border1");
    });
});

var carouselBotton = Array.from(document.getElementsByClassName("carouselBotton"));
carouselBotton.forEach((botton)=>{
    botton.addEventListener("click", function(){
        var active = Array.from(document.getElementsByClassName("active"));
        var id = active[0].getAttribute('id').slice(-1);
        displayImages.forEach((image) => {
            image.classList.remove("border1");
        });
        displayImages[id-1].classList.add("border1");
    });
})
