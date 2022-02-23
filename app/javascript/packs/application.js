// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
//Turbolinks.start()
ActiveStorage.start()



window.onload = function() {
    const camera = document.getElementById("camera");
    const imageBox = document.getElementById("imageBox");
    const form = document.getElementById("form");
    let i = 1;
    camera.addEventListener("click", function(){
        let getImages = document.getElementsByClassName("getImages");
        let getImage = getImages[0];
        let id = getImage.getAttribute('id');
        
        getImage.click();
        
        i+=1;
        
        if (i<3) { //getImageにイベントが2回以上つくのを防ぐ removeEventも考えたが無名関数の場合できないらしい
            getImage.addEventListener("change", function(e){
            
                let file = e.target.files;
                let reader = new FileReader();
                //dataURL形式でファイルを読み込む
                reader.readAsDataURL(file[0]);
                //ファイルの読込が終了した時の処理
                reader.onload = function(){
                        let dataUrl = reader.result;
                        let html = `
                            <div class="card inline my-3" id="card${id}" style="width: 11rem;">
                                <img src="${dataUrl}" class="card-img-top" style="height: 150px;">
                                <div class="card-body">
                                    <p class="card-text btn btn-danger" id="image${id}">削除</p>
                                </div>
                            </div>
                    `
                    //読み込んだ画像とdataURLを書き出す
                    imageBox.insertAdjacentHTML('beforeend', html)
                    getImage.classList.remove("getImages");
                    let del = document.getElementById(`image${id}`);
                    del.addEventListener("click", function(){
                        let input = document.getElementById(`${id}`);
                        input.remove();
                        let card = document.getElementById(`card${id}`);
                        card.remove();
    
                        let new_form_html = `
                            <input accept="image/*" type="file" name="protein[protein_images][]" class="getImages inputImage" id="${id}">
                        `
                        form.insertAdjacentHTML('beforeend', new_form_html);
                    });
                    i = 1;
                };
            
            });
        }
    });
};
