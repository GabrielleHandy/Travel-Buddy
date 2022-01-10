const popover = new bootstrap.Popover(document.querySelector('.popover-dismiss'), {
    trigger: 'focus'
  })


const hotelForm = document.querySelector('#hotel_choice');

hotelForm.addEventListener('submit', (evt) => {
    evt.preventDefault();
    let oldButton = document.querySelector('#seeResults');
    if (oldButton != null){
        oldButton.remove();
    }
    
    const destination = document.getElementById("destination").value;
    const checkin = document.querySelector('#checkin').value;
    const checkout = document.querySelector('#checkout').value;
    const sortBy = document.querySelector('#sort-order').value;
    const adult_num= document.querySelector('#adult_num').value;
    
    
    
    find_hotels(destination,checkin,checkout,sortBy,adult_num);
    hotelForm.insertAdjacentHTML('beforeEnd', "<button id='seeResults' type='button' data-bs-toggle='modal' data-bs-target='#hotels'>See Results!</button>");

    
});






//function to manipulate the data given in a pull from hotel
function display_hotels(hotelData) {
    // Takes in the json data and places it in hotel results
    // also takes in optional 
    const header = document.querySelector('#hotelHeader');
    
    const displayResult = document.querySelector('#hotel_results');
    console.log(hotelData);

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

                if ('starRating' in results[result]){
                    hotel_form.insertAdjacentHTML("beforeEnd", `<p><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star" viewBox="0 0 16 16">
                    <path d="M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.522-3.356c.33-.314.16-.888-.282-.95l-4.898-.696L8.465.792a.513.513 0 0 0-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767-3.686 1.894.694-3.957a.565.565 0 0 0-.163-.505L1.71 6.745l4.052-.576a.525.525 0 0 0 .393-.288L8 2.223l1.847 3.658a.525.525 0 0 0 .393.288l4.052.575-2.906 2.77a.565.565 0 0 0-.163.506l.694 3.957-3.686-1.894a.503.503 0 0 0-.461 0z"/>
                  </svg> Star Rating: ${results[result]['starRating']} stars</p>`);
                }

                 if (('guestReviews' in results[result])){
                    const rating_num = results[result]['guestReviews']['rating'];
                    const rating_text= results[result]['guestReviews']['badgeText'];
                    const reviews= results[result]['guestReviews']['total'];
                    hotel_form.insertAdjacentHTML('beforeEnd',
                    `<p>Guest rating: ${rating_num}/5 ${rating_text} Reviews:${reviews} </p>`);
                }
                
                if ('scarcity' in message) {
                    hotel_form.insertAdjacentHTML('beforeEnd', `<p>${message['scarcity']}</p>`);
                }
                hotel_form.insertAdjacentHTML('beforeEnd', `<div for="info" id=info${result}>  
                                                <p>Free Cancelation: ${Cancelation}</p>
                                                <p>No credit card required:${creditCard}</p>
                                                <p>${price} per night</p>
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
        console.log(data);
        if (data['suggestions'][0]['entities'].length > 0){

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
        


    }
    else {
        const displayResult = document.querySelector('#hotel_results');
        displayResult.innerHTML = `Sorry, couldn't find results in ${destination}`;

    }})
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
    const alert = document.getElementById('Alert');
    if (value === "Travel planners must have atleast one destination. Try removing after adding a new destination.")
    {
        let message = "Travel planners must have atleast one destination.\nTry removing after adding a new destination.";
        return alert.innerHTML = '<div class="alert alert-warning alert-dismissible" role="alert">' + message + '<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button></div>'
    }
    let link = window.location.href;
    let message = `Deleted Sucessfully! click <a href= "${link}" class='alert-link'>here</a> to refresh the page!`;
    return alert.innerHTML = '<div class="alert alert-success alert-dismissible" role="alert">' + message + '<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button></div>'
    
};

// Sets min for checkout date 
function setMin(){
    const checkin = document.querySelector("#checkin").value;
    const checkout = document.querySelector("#checkout");

    checkout.min = checkin;
    
}



// for countries and cities in add_destination
const input = document.querySelector('#add_dest_country');
const cityInput = document.querySelector('#add_dest_city');
const cities = document.querySelector('#AD_list_of_cities');

input.addEventListener('change', addCities);

function addCities(e) {
//   Using an API to get the cities in a country
    e.preventDefault();
    cities.innerHTML = '';
    cityInput.value = '';
    let chosenCountry = e.target.value;
  
      console.log(countries);
      for (city of countries[chosenCountry]){
               cities.insertAdjacentHTML('beforeEnd', `<option value="${city}"></option>`); 
            }
        
    
};
