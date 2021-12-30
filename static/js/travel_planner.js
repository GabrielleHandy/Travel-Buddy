


const hotelForm = document.querySelector('#hotel_choice');

hotelForm.addEventListener('submit', (evt) => {
    evt.preventDefault();
    const destination = document.getElementById("destination").value;
    const checkin = document.querySelector('#checkin').value;
    const checkout = document.querySelector('#checkout').value;
    const sortBy = document.querySelector('#sort-order').value;
    const adult_num= document.querySelector('#adult_num').value;
    
    hotelForm.insertAdjacentHTML('beforeEnd', "<button type='button' data-bs-toggle='modal' data-bs-target='#hotels'>See Results!</button>");
    
    find_hotels(destination,checkin,checkout,sortBy,adult_num);
    

    
});






//function to manipulate the data given in a pull from hotel
function display_hotels(hotelData) {
    // Takes in the json data and places it in hotel results
    // also takes in optional 
    displayResult = document.querySelector('#hotel_results');
    

    if (!('searchResults' in hotelData)) {
        displayResult.insertAdjacentHTML('beforeEnd', 
                    `<h4>${hotelData['detail'][0]['msg']}</h4>`);
    }

    else { 
    results = hotelData['searchResults']['results'];
    
    for (result in results){
        if (result === 10){
            break;
        }
        else{
            
                const img_url = results[result]['optimizedThumbUrls']['srpDesktop'];
                console.log(img_url);
                const name= results[result]['name'];
                const message = results[result]['messaging'];
                // rating info
                const rating_num = results[result]['guestReviews']['rating'];
                const rating_text= results[result]['guestReviews']['badgeText'];
                const reviews= results[result]['guestReviews']['total'];
                // price info
                const Cancelation =  results[result]['ratePlan']['features']['freeCancellation'];
                const creditCard = results[result]['ratePlan']['features']['noCCRequired'];
                const price = results[result]['ratePlan']['price']['current'];
                const total = results[result]['ratePlan']['price']['fullyBundledPricePerStay'];
                

                displayResult.insertAdjacentHTML('beforeEnd',`<div class='hotel_card' id =hotel${result}></div>`);
                hotel_form = document.querySelector(`#hotel${result}`);

                hotel_form.insertAdjacentHTML('afterBegin',
                `<img src=${img_url} alt="Hotel img"></img>`);

                hotel_form.insertAdjacentHTML('beforeEnd', `<h5>${name}</h5>`);
                hotel_form.insertAdjacentHTML('beforeEnd',
                `<p>Rating: ${rating_num}/5 ${rating_text} Reviews:${reviews} </p>`);
                if ('scarcity' in message) {
                    hotel_form.insertAdjacentHTML('beforeEnd', `<p>${message['scarcity']}</p>`);
                }
                hotel_form.insertAdjacentHTML('beforeEnd', `<div for="info" id=info${result}>  
                                                <p>Free Cancelation: ${Cancelation}</p>
                                                <p>No credit card required:${creditCard}</p>
                                                <p>$${price} per night</p>
                                                <p style="background-color: gold;">${total}</p>               
                                                `);
  
                
            }
        
        }

        
                
        
        return results 
    }    
};






function find_hotels(destination,checkin,checkout,sortBy,adult_num) {
    // first fetch information
    const param = {'destination': destination};
    const options = {
        method: 'POST',
        body: JSON.stringify( param ),  
        headers: {
            'Content-Type': 'application/json'
        }
    };



    // first fetch
    // Retrieve Destination Id 
    fetch('/find_destid', options)
    .then(response => response.json())
    .then(data => {
        console.log(data['suggestions'][0]['entities'][0]['destinationId']);
        const dest_id =data['suggestions'][0]['entities'][0]['destinationId'];
        
        //secoond fetch information
        const params = {'dest_id': dest_id,
        'checkin': checkin,
        'checkout': checkout,
        'sortBy': sortBy,
        'adult_num': adult_num
        }
        console.log(params);
        const options_fetch2 = {
                method: 'POST',
                body: JSON.stringify( params ),  
                headers: {
                    'Content-Type': 'application/json'
                }
            };


        return fetch('/find_hotels', options_fetch2) // 2nd fetch
        .then(response => response.json())
        .then(data => display_hotels(data))
        

        .catch(err => {
        console.error('Request failed', err)
        })
        


    })
    
};

    



// Activate forms to add or delete on click
function showForm(action){
    
    const removeForm = document.querySelector('#remove_dest');
    if(removeForm.style.visibility === 'visible'){
        removeForm.style.visibility = 'hidden';
    }
    else {
        removeForm.style.visibility = 'visible';
    }
        
   
};
// Delete form double check
const deleteBtn = document.querySelector("#delete");

deleteBtn.addEventListener('click', (evt) => {
    evt.preventDefault();
    answer= confirm("Are you sure you want to delete this destination?");
    if (answer === true){
        const tp_id = document.querySelector("#tp_id").value;
        const dest_id = document.querySelector("#dest_id").value;

        const params = {'tp_id': tp_id,
                  'dest_id': dest_id};
        const options = {
        method: 'POST',
        body: JSON.stringify( params ),  
        headers: {
            'Content-Type': 'application/json'
                }
        };

        fetch('/remove_dest', options)
        .then(data => data.json())
        .then(message => deleteMsg(message))
    }

});

// message alert for error
function deleteMsg(value){
    console.log(value);
    if (value === "Travel planners must have atleast one destination. Try removing after adding a new destination.")
    {
        return alert("Travel planners must have atleast one destination.\nTry removing after adding a new destination.")
    }
    
    return alert("Deleted Sucessfully! Refresh to see changes")
    
};

// Sets min for checkout date 
function setMin(){
    const checkin = document.querySelector("#checkin").value;
    const checkout = document.querySelector("#checkout");

    checkout.min = checkin;
    
}



