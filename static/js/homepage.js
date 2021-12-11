

const change = document.querySelector("button");
change.addEventListener("click", (evt)=>{
const clickbutton =evt.target;
console.log(clickbutton);
if (clickbutton.innerHTML === 'Are you a new buddy? sign up here!'){
    let hiddenForm = document.querySelector('#login-form');
    let unhiddenForm = document.querySelector('#signup-form');
    clickbutton.innerHTML = 'Already a buddy? Login here'
    hiddenForm.style.visibility = 'hidden'
    unhiddenForm.style.visibility = 'visible'
}
else {
    let hiddenForm = document.querySelector('#signup-form')
    let unhiddenForm = document.querySelector('#login-form')
    clickbutton.innerHTML = 'Are you a new buddy? sign up here!';
    hiddenForm.style.visibility = 'hidden'
    unhiddenForm.style.visibility = 'visible'
}


});