var commentForm = document.getElementById("commentForm");
var commentBotton = document.getElementById("commentBotton");
commentBotton.addEventListener("click", function(e){
    if(commentForm.value=="") {
        e.preventDefault();
    }
});