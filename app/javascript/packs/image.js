window.onload = function() {
    const camera = document.getElementById("camera");
    const imageBox = document.getElementById("imageBox");
    const form = document.getElementById("form"); //投稿フォーム
    let i = 0;
    camera.addEventListener("click", function(){
        let getImages = document.getElementsByClassName("getImages"); //tyep=ファイルのinput
        let getImage = getImages[0];
        let id = getImage.getAttribute('id');
        
        getImage.click();
        
        i+=1;
        
        if (i==1) { //getImageにイベントが2回以上つくのを防ぐ removeEventも考えたが無名関数の場合できないらしい
            getImage.addEventListener("change", function(e){
            
                let file = e.target.files;
                let reader = new FileReader();
                reader.readAsDataURL(file[0]); //dataURL形式でファイルを読み込む
                reader.onload = function(){ //ファイルの読込が終了した時の処理
                        let dataUrl = reader.result;
                        let html = `
                            <div class="card inline my-3" id="card${id}" style="width: 11rem;">
                                <img src="${dataUrl}" class="card-img-top" style="height: 150px;">
                                <div class="card-body">
                                    <p class="card-text btn btn-danger" id="image${id}">削除</p>
                                </div>
                            </div>
                        `
                    imageBox.insertAdjacentHTML('beforeend', html) //読み込んだ画像とdataURLを書き出す
                    getImage.classList.remove("getImages");


                    let del = document.getElementById(`image${id}`); //削除ボタンを押した時
                    del.addEventListener("click", function(){
                        let input = document.getElementById(`${id}`);
                        input.remove();
                        let card = document.getElementById(`card${id}`);
                        card.remove();
    
                        let new_form_html = `
                            <input accept="image/*" type="file" name="protein[protein_images][]" class="getImages inputImage display_none" id="${id}">
                        `
                        form.insertAdjacentHTML('beforeend', new_form_html);
                    });
                    i = 0;
                };
            
            });
        }
    });
};
