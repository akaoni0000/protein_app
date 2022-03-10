const { ConfigObject } = require("@rails/webpacker/package/config_types");

window.onload = () => {
    //チェックボックス
    let check = Array.from( document.getElementsByClassName("check") );
    check.forEach((check)=>{
        check.addEventListener("click", function(){
            check.previousElementSibling.click();
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

    //並び替え
    let order = document.getElementById("order");
    let orderSubmit = document.getElementById("orderSubmit");
    order.addEventListener('change', () => {
        orderSubmit.click();
    });
    if (gon.num) {
        order.options[gon.num].selected = true;
    }

    //検索条件を保存する
    //味について
    let check_boxs = Array.from( document.getElementsByClassName("check_box") );
    let tastes = gon.taste
    tastes.forEach((taste)=>{
        check_boxs.forEach((check_box)=>{
            if ( taste==check_box.value ) {
                check_box.click();
            }
        })
    })
 
    //値段について
    inputElem0.value = gon.price[0]
    output0.innerHTML = gon.price[0]
    inputElem1.value = gon.price[1]
    output1.innerHTML = gon.price[1]

    //内容量について
    inputElem2.value = gon.large_weight
    output2.innerHTML = gon.large_weight

    //割合について
    inputElem3.value = gon.ratio[0]
    output3.innerHTML = gon.ratio[0]
    inputElem4.value = gon.ratio[1]
    output4.innerHTML = gon.ratio[1]

}