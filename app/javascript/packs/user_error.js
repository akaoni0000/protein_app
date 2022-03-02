let inputs = document.querySelectorAll('.field_with_errors *');
inputs.forEach((input)=>{
    input.classList.add("is-invalid");
    if (input.classList.contains("name_form")) {
        gon.name_error_messages.forEach((message)=>{
            let html = `<p class='invalid-feedback'>${message}</p>`
            input.insertAdjacentHTML('afterend', html);
        });
    }
    else if(input.classList.contains("email_form")) {
        gon.email_error_messages.forEach((message)=>{
            let html = `<p class='invalid-feedback'>${message}</p>`
            input.insertAdjacentHTML('afterend', html);
        });
    }
    else if(input.classList.contains("password_form")) {
        gon.password_error_messages.forEach((message)=>{
            let html = `<p class='invalid-feedback'>${message}</p>`
            input.insertAdjacentHTML('afterend', html);
        });
    }
    else if(input.classList.contains("password_confirmation_form")) {
        gon.password_confirmation_error_messages.forEach((message)=>{
            let html = `<p class='invalid-feedback'>${message}</p>`
            input.insertAdjacentHTML('afterend', html);
        });
    }
});