window.onload = () => {
    //チェックボックス
    let checkbox = Array.from( document.getElementsByClassName("checkbox") );
    checkbox.forEach((box)=>{
       box.addEventListener("click", function(){
           var input = box.firstElementChild;
           //console.log(input.checked);
           var check = input.checked
           if (check) {
                input.checked = false;
           } 
           else {
                input.checked = true;
           }
       });
    });
    
    //rangeフォーム
    const inputElem0 = document.getElementById('inputElem0'); // input要素
    inputElem0.addEventListener('input', function(){
        var output0 = document.getElementById("output0");
        output0.innerHTML = inputElem0.value;
    }); 
    const inputElem1 = document.getElementById('inputElem1'); // input要素
    inputElem1.addEventListener('input', function(){
        var output1 = document.getElementById("output1");
        output1.innerHTML = inputElem1.value
    }); 
    const inputElem2 = document.getElementById('inputElem2'); // input要素
    inputElem2.addEventListener('input', function(){
        var output2 = document.getElementById("output2");
        output2.innerHTML = inputElem2.value;
    }); 
    const inputElem3 = document.getElementById('inputElem3'); // input要素
    inputElem3.addEventListener('input', function(){
        var output3 = document.getElementById("output3");
        output3.innerHTML = inputElem3.value;
    }); 
    const inputElem4 = document.getElementById('inputElem4'); // input要素
    inputElem4.addEventListener('input', function(){
        var output4 = document.getElementById("output4");
        output4.innerHTML = inputElem4.value
    }); 
}