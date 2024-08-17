




function translateText(text, target, source){
    // makes a call to the backend to translate text
    const params = {'text': text,
                    'target': target,
                   'source': source};
    const options = {
        method: 'POST',
        body: JSON.stringify( params ),  
        headers: {
            'Content-Type': 'application/json'
        }
    };
    fetch('/translate_text', options)
    .then(response => response.json())
    .then(translation => document.querySelector("#translated").value = translation);

};



const photoForm = document.querySelector('#translated-photo');
// Call to strip text from photo and translate text
photoForm.addEventListener('submit', function(e) {
    e.preventDefault()

    const source = document.querySelector('#source').value;
    const target = document.querySelector('#target').value;
    // console.log(e.target);
     // let file = e.target.original-photo.files[0] 
    let file = document.querySelector('#photo').files[0];
     
    let formData = new FormData();

    formData.append("source", source);
    formData.append("target", target);
    reader = new FileReader();
    reader.readAsDataURL(file);
    reader.onload = function(evt) {    
        
   
        formData.append('photo', `${reader.result}`); 

        fetch('/translated_photo', {
            method: 'POST',
            body: formData
        })
        .then(resp => resp.json())
        .then(originalText => document.querySelector("#original").innerHTML = originalText)
        .then(text => translateText(text, target, source));
      
    };

 });

// Call to take text and translate it
const textForm = document.querySelector('#trans-text');
textForm.addEventListener('submit', (evt) => {
    evt.preventDefault();
    const text = document.querySelector("#original-text").value;
    const source =document.querySelector("#source-language").value;
    const target = document.querySelector("#target-text").value;
    
    document.querySelector("#original").value = text;
    translateText(text, target, source);
});

// Call to delete Travel Planners on the profile page
function showForm(text){
    const listOfTp = document.querySelector("#list_of_tp");
    const travelPlanners = listOfTp.children;

    

    if (text === 'Cancel delete'){
        showDeleteForm.innerHTML= "Delete travel planner(s)";
        let tp_buttons =  document.querySelectorAll(".deleteTpBtn")
        
        while(tp_buttons.length > 0){
            for(btn of tp_buttons){
               btn.parentNode.removeChild(btn);
            } 
            }
            

    }
    else{
        showDeleteForm.innerHTML= 'Cancel delete';
        for (tp of travelPlanners){
            tp.insertAdjacentHTML('beforeEnd', `<button class="deleteTpBtn" id =${tp.value} onclick ="deleteTP(this);">Delete</button>`);
        }
    }
};

const showDeleteForm = document.querySelector("#showdelete_tp");

showDeleteForm.addEventListener('click', (evt) => {
    

    showForm(showDeleteForm.innerHTML);
    
})



function deleteTP(id){
    
    const btn = id;

    const answer= confirm("Are you sure you want to delete this Travel Planner?");
    if (answer === true){
        const tp_id = btn.parentNode.id;
        

        const param = {'tp_id': tp_id}
                
        const options = {
        method: 'POST',
        body: JSON.stringify( param ),  
        headers: {
            'Content-Type': 'application/json'
                }
        };

        fetch("/delete_tp", options)
        .then(data => data.json())
        .then(alert("Deleted Sucessfully! Refresh to see changes"))

    }

    };



