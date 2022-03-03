let userImg = document.getElementById("changeImg");
let userImgForm = document.getElementById("userImgForm");
let submitBtn = document.getElementById("submitBtn");
changeImg.addEventListener("click", function(){
    userImgForm.click();
});
userImgForm.addEventListener("change", function(){
    submitBtn.click();
});


