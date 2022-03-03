# Travel-Buddy [Visit Travel Buddy!](https://www.travelbuddy.top)

Traveling can be unpredictable, especially now during the time of Covid-19.  
Travel Buddy was created to help people while traveling to feel safe and secure knowing that emergency information can be found in a centralized place.
Travel Buddy is a web app where users can create a travel planner with destinations they plan to go to.
Once created they can find pertinent travel advisory information about embassy locations, emergency numbers, weather, currency, and hotel recommendations for each destination. 
The profile page also offers news and a translator that also translates text from an image. All links providing more information go to reputable government websites.


# Tech Stack: 
SQL, JS, HTML, CSS, PostgreSQL, Bootstrap, SQLAlchemy, Jinja2, Flask, AWS

# APIs:
OCR API, Hotels API,  OpenWeather API,  MyMemory Translation API,  REST COUNTRIES,  Free Currency API,  Google Maps API,  Link Preview API


# Problems I faced:

Translating text from images:
--- Recieving Images from users wasn't possible because I don't have ssl certification. In order to get past that I used Cloudinary API that let's users update images
    to cloud storage ad used the url provided from that to access the image I needed.

--- I also needed a way to scrape the text off of an image. I used OCR API in order to acheive that and then ran the results through the translator.

Information coming from RSS Feeds:
--- Before this project I had never had any experience manipulating xml data. It was really exciting to learn how to use packages like Element Tree and xmlparse 
    in order to create features like travel advisories and news feed.

Creating URLs for all websites:
--- Most information provided on my website came from datasets directly from government pages. The probllem arouse when Uk government had no advisory website links and 
    US government had no address links available for some embassy locations or embassy websites. 
    
--- I used Google maps reverse geocoding feature to create addresses for embassies

--- I also did hands on research and found that US gov pages used alpha2 country codes for websites for ex. (Germany => de => https://de.usembassy.gov/)
--- So I used REST COUNTRIES to find the country code and plugged it into this template {alpha2 country code}.usembassy.gov

--- I did this same technique for UK travel advisories: they used the route https://www.gov.uk/foreign-travel-advice/{lower case dash separated countries}
ex. https://www.gov.uk/foreign-travel-advice/taiwan
    
    

Video Demo Below!

https://user-images.githubusercontent.com/91081738/150046847-e0f0207c-8e53-4010-a7dd-7b07de8416e9.mp4

