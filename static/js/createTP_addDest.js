const input = document.querySelector('#country');
const cityInput = document.querySelector('#city');
const cities = document.querySelector('#list_of_cities');

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


