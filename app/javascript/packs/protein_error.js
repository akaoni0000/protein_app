let inputs = document.querySelectorAll('.field_with_errors *');
inputs.forEach((input)=>{
    input.classList.add("is-invalid");
    if (input.classList.contains("name_form")) {
        gon.name_error_messages.forEach((message)=>{
            let html = `<p class='invalid-feedback'>${message}</p>`
            input.insertAdjacentHTML('afterend', html);
        });
    }
    else if(input.classList.contains("feature_form")) {
        gon.feature_error_messages.forEach((message)=>{
            let html = `<p class='invalid-feedback'>${message}</p>`
            input.insertAdjacentHTML('afterend', html);
        });
    }
    else if(input.classList.contains("price_form")) {
        gon.price_error_messages.forEach((message)=>{
            let html = `<p class='invalid-feedback'>${message}</p>`
            input.insertAdjacentHTML('afterend', html);
        });
    }
    else if(input.classList.contains("height_form")) {
        gon.height_error_messages.forEach((message)=>{
            let html = `<p class='invalid-feedback'>${message}</p>`
            input.insertAdjacentHTML('afterend', html);
        });
    }
    else if(input.classList.contains("protein_height_form")) {
        gon.protein_height_error_messages.forEach((message)=>{
            let html = `<p class='invalid-feedback'>${message}</p>`
            input.insertAdjacentHTML('afterend', html);
        });
    }
    else if(input.classList.contains("large_height_form")) {
        gon.large_height_error_messages.forEach((message)=>{
            let html = `<p class='invalid-feedback'>${message}</p>`
            input.insertAdjacentHTML('afterend', html);
        });
    }
    else if(input.classList.contains("taste_form")) {
        gon.taste_error_messages.forEach((message)=>{
            let html = `<p class='invalid-feedback'>${message}</p>`
            input.insertAdjacentHTML('afterend', html);
        });
    }
});