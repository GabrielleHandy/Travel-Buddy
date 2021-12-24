'''CRUD operations'''
from model import db,connect_to_db, User, Travel_planner, Destination, Embassy, TpDest
import requests
import os
from datetime import datetime 
import calendar




import xml.parsers.expat
from xml.etree import ElementTree as ET

# google_key ip restricted
google_key = 'AIzaSyDGFnnxaxYd_2SHJ9jEPUjzEOJTDIkKoPs'
OCR_API = os.environ['OCR_KEY']
WEATHER_KEY = os.environ['WEATHER_KEY']
MY_MEMORY = os.environ['MY_MEMORY']
# This section is for creating instances of 
# USER, TRAVEL_PLANNER, DESTINATION, OR EMBASSY
def create_user(first_name, last_name, email, password, home_country):
    """Create and return a new user."""

    user = User(fname= first_name, lname= last_name, 
                email=email, password=password, home_country=home_country)

    db.session.add(user)
    db.session.commit()

    return user


def create_travelplanner(name,user_id):
    """Creates a new Travel planner for user."""
   
    travel_planner = Travel_planner(name= name, user_id= user_id)
    

    db.session.add(travel_planner)
    db.session.commit()

    return travel_planner

# create a new function to create a new tp_dest
def create_tpdest(tp_id, dest_id, date = None):
  """Creates a tp_dest to create the connection between travelplanner and destinations"""

  tp_dest = TpDest(tp_id= tp_id, dest_id = dest_id, date = date)

  db.session.add(tp_dest)
  db.session.commit()

  return tp_dest



def create_destination(city, country):
    """Creates a Destination "used for seeding" """
    destination= Destination(city_name=city, country_name=country)

    db.session.add(destination)
    db.session.commit()
    return destination
    


def create_embassy(home_country, country,
                  lat, lng, city_name, address=None, website=None):
    """Creates a Embassy "used for seeding" """
    # Query for country and city name and tie relationship to that dest_id
    # if not you can create a new destination 
    # need city name and country name to put in query for dest_id
    if len(country) > 50:
        return 'Sorry country is too long'

    destination = Destination.query.filter(Destination.city_name == city_name , 
                                           Destination.country_name == country).first()
    if destination:
        dest_id = destination.dest_id
        embassy = Embassy(home_country=home_country,
                            latitude=lat, longitude=lng, 
                            address= address, website = website, dest_id=dest_id)

        db.session.add(embassy)
        db.session.commit()
        
    else:
        destination = create_destination(city_name, country)

        dest_id = destination.dest_id
        embassy = Embassy(home_country=home_country,
                            latitude=lat, longitude=lng, 
                            address= address, website = website, dest_id=dest_id)

        db.session.add(embassy)
        db.session.commit()
    
def add_geocode(address):
    """This function adds a lat and longitude to 
       american embassies that have no geolocation
       *for seeding*"""      
    result = []   
    res = requests.get(f'''https://maps.googleapis.com/maps/api/geocode/json?address={address}&key={google_key}''')
    results = res.json()
    
    if results['results']:
        results = results['results'][0]
        result = results['geometry']['location']

    
    return result
    

        
def add_address(lat, lng):
    """Adds an address using geocoding.
       This is for the UK embassies that have no addresses
       *For seeding*"""
    res = requests.get(f'''https://maps.googleapis.com/maps/api/geocode/json?latlng={lat},{lng}
                           &key={google_key}''')
    results = res.json()
    results = results['results']
    address = results[1]['formatted_address']
    
    return address
    
   

# This section is for adding information to already created instances
# Users
def get_user_by_email(email):
    """Get user instance from email"""
    return User.query.filter(User.email == email).first()

def get_user_by_id(user_id):
    """Get user instance from user_id"""
    return User.query.get(user_id)

# Destinations

def get_all_destinations():
    """Pulls all locations available"""
    return Destination.query.all()

def get_all_capitals():
    """Get's all capitals in worldcities.csv *seeding* """
    return Destination.query.filter(Destination.capital == True).all()

def get_cities():
    cities = []
    locations = get_all_destinations()
    for location in locations:
        cities.append(location.city_name)
    return cities



def get_destination_by_id(dest_id):
    return Destination.query.get(dest_id)

def get_destid_by_location(city_name,country):
    """Returns dest_id or..."""

    dest = Destination.query.filter(Destination.city_name == city_name, Destination.country_name == country).first()
    if dest:
      dest_id = dest.dest_id
      return dest_id
    return []

def list_all_countries(list_dest):
    """Creates a list of available countries 
    for the select menu in create a travelplanner
    
    takes in a list of all destinations"""
    
    
    list_countries = set()
    for country in list_dest:
        list_countries.add(country.country_name)

    return list_countries


def add_destination(dest_id, tp_id):  
    travel = get_travelplanner_by_id(tp_id)
    new_dest= get_destination_by_id(dest_id)
    if new_dest not in travel.destination:
        tp_dest = create_tpdest(tp_id, dest_id)
        return tp_dest
    
    return "Already in your travelplanner"

def get_country_code(country_name):
    """Gets calls from api to use in get_emer_num"""

    name = country_name.lower()
    res = requests.get(f'https://restcountries.com/v3.1/name/{name}')

    response = res.json()

    if response:
        results = response[0]

        country_code = results['ccn3']
    else:
        country_code = False

    return country_code
    

def get_country_currency(country_name):
    """Gets call from API to use in get_currency_rate """
    name = country_name.lower()
    res = requests.get(f'https://restcountries.com/v3.1/name/{name}')

    response = res.json()

    results = response[0]

    currency = []

    if len(results['currencies']) > 1:
        for currency in results['currencies']:
            keys = list(currency.keys())
            key = keys[0]
            currency.append([key, currency[key]['name'], currency[key]['symbol']])
    else:
        curr = results['currencies']
        keys = list(curr.keys())
        key = keys[0]
        currency.append([key, curr[key]['name'], curr[key]['symbol']])
    

    return(currency)

def get_emer_num(country_code):
    """Gets emergency info for specific countries based on country_code"""

    res = requests.get(f'https://emergencynumberapi.com/api/country/{country_code}')

    response = res.json()
    results = response['data']

    print(results)

def get_currency_rate(home_currency, country_currency):

    pass


# Embassies

def get_all_embassies():
    """Gets all embassies"""
    return Embassy.query.all()


def get_relevant_embassies(dest, user):
    """Takes in an instance of a destination 
        to return a list of embassies related
        to destination and user"""

    relevant_embassies = set()
    
    user_embassies = Embassy.query.options(db.joinedload('destination')).filter(Embassy.home_country == user.home_country)
    for embassy in user_embassies:
        if embassy.destination.country_name == dest.country_name:
            relevant_embassies.add(embassy)
        
    
    return relevant_embassies

def get_home_embassy(dest, user):

    embassy = dest.embassies
    places = []
    
   
    for place in embassy:
        if place.home_country == user.home_country: 
          places.append(place)
          return places
    
    if embassy == [] or places == []:
      return None





# Travel_planner

def get_travelplanner_by_id(tp_id):
    return Travel_planner.query.get(tp_id)

def check_for_repeats(dest_id, user_id):
    """Checks for repeats travelplanners"""
    user = get_user_by_id(user_id)
    tps = user.travel_planner
    
    for tp in tps:
        if tp.dest_id == dest_id:
            return False
    return True


## in Travel Planner but pulls from APIs and other sources

#Travel advisories specific to destination country
def retrieve_advisory(country_name, user):
    advisory = 'No Travel Advisory for this location'

    home_country = user.home_country

    if home_country == 'United States':
   
        res = requests.get('https://travel.state.gov/_res/rss/TAsTWs.xml')
        

        root = ET.fromstring(res.content)

        for country in root.iter("item"):
            title = country.find("title").text
            title = title.split("-")
            warning = country.find("category").text
            print(warning)
            name = title[0].strip()
            print(repr(name), name)
        
            if name == country_name:

                advisory = f"Travel Advisory: {warning}"

    elif home_country == 'Canada':


        res = requests.get('https://data.international.gc.ca/travel-voyage/index-alpha-eng.json')    

        response = res.json()
        results = response['data']

        for result in results:
            if results[result]["country-eng"] == country_name:
                advisory = f"Travel Advisory: {results[result]['eng']['advisory-text']}"
        

    return advisory

def get_advisory_url(country_name, user):
    """Rerieves the url links to gov pages with more info for country name"""

    home_country = user.home_country

    if home_country == 'United States':
        res = requests.get('https://travel.state.gov/_res/rss/TAsTWs.xml')
        

        root = ET.fromstring(res.content)

        for country in root.iter("item"):
            title = country.find("title").text
            title = title.split("-")
            name = title[0].strip()
    
            if name == country_name:

                url = country.find("link").text


    elif home_country == 'Canada':

        website = 'https://travel.gc.ca/destinations/'
        res = requests.get('https://data.international.gc.ca/travel-voyage/index-alpha-eng.json')    

        response = res.json()
        results = response['data']

        for result in results:
            if results[result]["country-eng"] == country_name:
                url = website + results[result]['eng']['url-slug']
   
    return url



#  weather api call inside travel_planners
def get_weather(city_name, user):
    default_unit = 'metric'
    if user.home_country == 'United States':
        default_unit = 'imperial'
       
   
    res = requests.get(f'http://api.openweathermap.org/data/2.5/forecast?q={city_name}&units={default_unit}&appid={WEATHER_KEY}')
    result = res.json()
    if 'list' in result:
        results = result['list']
        return results

    return result['message']

def extract_weather_info(results):
    """Takes in the json of the weather data and extracts relevant info
       returns a list of list with the first index is the naming 
       
       example 

    
       {'Wed, Dec 15': [['morning', 'clear sky', 10.3], 
       ['afternoon', 'clear sky', 10.71], ['evening', 
       'clear sky', 9.09]],...'Sun, Dec 19': [['morning', 'clear sky', 8.74], 
       ['afternoon', 'clear sky'], 8.02], ['evening', 'clear sky', 6.02]]}"""
    days = {}
    organize = 0
    for result in results:
        time = result['dt_txt'].strip().split()
        date = datetime.strptime(time[0], "%Y-%m-%d")
        day = calendar.day_abbr[date.weekday()]
        month = calendar.month_abbr[date.month]
                

        if time[1] == '06:00:00':

            morning = ['Morning', result['weather'][0]['description'], result['main']['temp'], organize]
            
            if f'{day}, {month} {date.day}' not in days: 
               days[f'{day}, {month} {date.day}'] = []
            
            days[f'{day}, {month} {date.day}'].append(morning)
            organize += 1          
            
        elif time[1] == '12:00:00':
            afternoon = ['Afternoon', result['weather'][0]['description'], result['main']['temp'], organize]

            if f'{day}, {month} {date.day}' not in days: 
               days[f'{day}, {month} {date.day}'] = []

            days[f'{day}, {month} {date.day}'].append(afternoon)
            organize += 1
            
        elif time[1] == '18:00:00':
            evening = ['Evening', result['weather'][0]['description'], result['main']['temp'], organize] 

            if f'{day}, {month} {date.day}' not in days: 
               days[f'{day}, {month} {date.day}'] = []

            days[f'{day}, {month} {date.day}'].append(evening) 
            organize += 1
        
    return days



# Call for photo strip and translataion
def strip_text(img_url, language):
    """This is to pull the text off of the image to translate """

    res =requests.get(f"https://api.ocr.space/parse/imageurl?apikey={OCR_API}&url={img_url}&language={language}")


    response = res.json()
    print(response)
    result = response['ParsedResults'][0]['ParsedText']
    result = result.split()
    
    return " ".join(result)


def translate(text, target_language, source):
    """Uses MyMemory- Translation Memory API to translate text"""


    url = "https://translated-mymemory---translation-memory.p.rapidapi.com/api/get"

    querystring = {"langpair":f"{source}|{target_language}","q":f"{text}"}

    headers = {
        'x-rapidapi-key': MY_MEMORY,
        'x-rapidapi-host': "translated-mymemory---translation-memory.p.rapidapi.com"
        }

    response = requests.request("GET", url, headers=headers, params=querystring)

    res = response.json()
    print(res)
    result = res['responseData']['translatedText']
    return result



# Datasets used for language translations
# language codes necessary for strip photo and translation 

def get_photo_lang_options():
    """Gives a dictionary of languges available for photo stripping"""
    lan=    {"Arabic": "ara",
            "Bulgarian": "bul",
            "Chinese(Simplified)": "chs",
            "Chinese(Traditional)": "cht",
            "Croatian" : "hrv",
            "Czech" : "cze",
            "Danish" : "dan",
            "Dutch" : "dut",
            "English" : "eng",
            "Finnish" : "fin",
            "French" : "fre",
            "German" : "ger",
            "Greek" : "gre",
            "Hungarian" : "hun",
            "Korean" : "kor",
            "Italian" : "ita",
            "Japanese" : "jpn",
            "Polish" : "pol",
            "Portuguese" : "por",
            "Russian" : "rus",
            "Slovenian" : "slv",
            "Spanish" : "spa",
            "Swedish" : "swe",
            "Turkish" : "tur"}

    return lan

def get_languages_text():
    """gets languages for text translation"""
    """Found this awesome dataset from https://github.com/itsecurityco/to-google-translate/find/master"""
    google_supported = [
    {
      "language": "Afrikaans",
      "code": "af"
    },
    {
      "language": "Albanian",
      "code": "sq"
    },
    {
      "language": "Amharic",
      "code": "am"
    },
    {
      "language": "Arabic",
      "code": "ar"
    },
    {
      "language": "Armenian",
      "code": "hy"
    },
    {
      "language": "Azerbaijani",
      "code": "az"
    },
    {
      "language": "Basque",
      "code": "eu"
    },
    {
      "language": "Belarusian",
      "code": "be"
    },
    {
      "language": "Bengali",
      "code": "bn"
    },
    {
      "language": "Bosnian",
      "code": "bs"
    },
    {
      "language": "Bulgarian",
      "code": "bg"
    },
    {
      "language": "Catalan",
      "code": "ca"
    },
    {
      "language": "Cebuano",
      "code": "ceb"
    },
    {
      "language": "Chinese (Simplified)",
      "code": "zh-CN"
    },
    {
      "language": "Chinese (Traditional)",
      "code": "zh-TW"
    },
    {
      "language": "Corsican",
      "code": "co"
    },
    {
      "language": "Croatian",
      "code": "hr"
    },
    {
      "language": "Czech",
      "code": "cs"
    },
    {
      "language": "Danish",
      "code": "da"
    },
    {
      "language": "Dutch",
      "code": "nl"
    },
    {
      "language": "English",
      "code": "en"
    },
    {
      "language": "Esperanto",
      "code": "eo"
    },
    {
      "language": "Estonian",
      "code": "et"
    },
    {
      "language": "Finnish",
      "code": "fi"
    },
    {
      "language": "French",
      "code": "fr"
    },
    {
      "language": "Frisian",
      "code": "fy"
    },
    {
      "language": "Galician",
      "code": "gl"
    },
    {
      "language": "Georgian",
      "code": "ka"
    },
    {
      "language": "German",
      "code": "de"
    },
    {
      "language": "Greek",
      "code": "el"
    },
    {
      "language": "Gujarati",
      "code": "gu"
    },
    {
      "language": "Haitian Creole",
      "code": "ht"
    },
    {
      "language": "Hausa",
      "code": "ha"
    },
    {
      "language": "Hawaiian",
      "code": "haw"
    },
    {
      "language": "Hebrew",
      "code": "iw"
    },
    {
      "language": "Hindi",
      "code": "hi"
    },
    {
      "language": "Hmong",
      "code": "hmn"
    },
    {
      "language": "Hungarian",
      "code": "hu"
    },
    {
      "language": "Icelandic",
      "code": "is"
    },
    {
      "language": "Igbo",
      "code": "ig"
    },
    {
      "language": "Indonesian",
      "code": "id"
    },
    {
      "language": "Irish",
      "code": "ga"
    },
    {
      "language": "Italian",
      "code": "it"
    },
    {
      "language": "Japanese",
      "code": "ja"
    },
    {
      "language": "Javanese",
      "code": "jw"
    },
    {
      "language": "Kannada",
      "code": "kn"
    },
    {
      "language": "Kazakh",
      "code": "kk"
    },
    {
      "language": "Khmer",
      "code": "km"
    },
    {
      "language": "Korean",
      "code": "ko"
    },
    {
      "language": "Kurdish",
      "code": "ku"
    },
    {
      "language": "Kyrgyz",
      "code": "ky"
    },
    {
      "language": "Lao",
      "code": "lo"
    },
    {
      "language": "Latin",
      "code": "la"
    },
    {
      "language": "Latvian",
      "code": "lv"
    },
    {
      "language": "Lithuanian",
      "code": "lt"
    },
    {
      "language": "Luxembourgish",
      "code": "lb"
    },
    {
      "language": "Macedonian",
      "code": "mk"
    },
    {
      "language": "Malagasy",
      "code": "mg"
    },
    {
      "language": "Malay",
      "code": "ms"
    },
    {
      "language": "Malayalam",
      "code": "ml"
    },
    {
      "language": "Maltese",
      "code": "mt"
    },
    {
      "language": "Maori",
      "code": "mi"
    },
    {
      "language": "Marathi",
      "code": "mr"
    },
    {
      "language": "Mongolian",
      "code": "mn"
    },
    {
      "language": "Myanmar (Burmese)",
      "code": "my"
    },
    {
      "language": "Nepali",
      "code": "ne"
    },
    {
      "language": "Norwegian",
      "code": "no"
    },
    {
      "language": "Nyanja (Chichewa)",
      "code": "ny"
    },
    {
      "language": "Pashto",
      "code": "ps"
    },
    {
      "language": "Persian",
      "code": "fa"
    },
    {
      "language": "Polish",
      "code": "pl"
    },
    {
      "language": "Portuguese (Portugal, Brazil)",
      "code": "pt"
    },
    {
      "language": "Punjabi",
      "code": "pa"
    },
    {
      "language": "Romanian",
      "code": "ro"
    },
    {
      "language": "Russian",
      "code": "ru"
    },
    {
      "language": "Samoan",
      "code": "sm"
    },
    {
      "language": "Scots Gaelic",
      "code": "gd"
    },
    {
      "language": "Serbian",
      "code": "sr"
    },
    {
      "language": "Sesotho",
      "code": "st"
    },
    {
      "language": "Shona",
      "code": "sn"
    },
    {
      "language": "Sindhi",
      "code": "sd"
    },
    {
      "language": "Sinhala (Sinhalese)",
      "code": "si"
    },
    {
      "language": "Slovak",
      "code": "sk"
    },
    {
      "language": "Slovenian",
      "code": "sl"
    },
    {
      "language": "Somali",
      "code": "so"
    },
    {
      "language": "Spanish",
      "code": "es"
    },
    {
      "language": "Sundanese",
      "code": "su"
    },
    {
      "language": "Swahili",
      "code": "sw"
    },
    {
      "language": "Swedish",
      "code": "sv"
    },
    {
      "language": "Tagalog (Filipino)",
      "code": "tl"
    },
    {
      "language": "Tajik",
      "code": "tg"
    },
    {
      "language": "Tamil",
      "code": "ta"
    },
    {
      "language": "Telugu",
      "code": "te"
    },
    {
      "language": "Thai",
      "code": "th"
    },
    {
      "language": "Turkish",
      "code": "tr"
    },
    {
      "language": "Ukrainian",
      "code": "uk"
    },
    {
      "language": "Urdu",
      "code": "ur"
    },
    {
      "language": "Uzbek",
      "code": "uz"
    },
    {
      "language": "Vietnamese",
      "code": "vi"
    },
    {
      "language": "Welsh",
      "code": "cy"
    },
    {
      "language": "Xhosa",
      "code": "xh"
    },
    {
      "language": "Yiddish",
      "code": "yi"
    },
    {
      "language": "Yoruba",
      "code": "yo"
    },
    {
      "language": "Zulu",
      "code": "zu"
    }
  ]

    return google_supported




if __name__ == '__main__':
    from server import app
    connect_to_db(app)

    useer = get_user_by_id(1)
    