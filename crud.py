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


link_preview = os.environ['LINKP_KEY']
us_linkpreview = {}
ca_linkpreview = {}
uk_linkpreview = {}

OCR_API = os.environ['OCR_KEY']
WEATHER_KEY = os.environ['WEATHER_KEY']
MY_MEMORY = os.environ['MY_MEMORY']
CURRENCY_KEY = os.environ['CURRENCY_KEY']
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



def delete_travelplanner(travel_planner):
    db.session.delete(travel_planner)
    db.session.commit()
    return "deleted"



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



def get_cities(list_dest = None):
    cities = []
    if list_dest:
      locations = list_dest
    else:
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



def find_tpdest(dest_id, tp_id):
    """Finds the Tp_dest for the connection between destination and Travel Planners"""
    tp_dest = TpDest.query.filter(TpDest.dest_id == dest_id, TpDest.tp_id == tp_id).first()

    return tp_dest





def add_destination(dest_id, tp_id, date):  
    travel = get_travelplanner_by_id(tp_id)
    new_dest= get_destination_by_id(dest_id)
    if new_dest not in travel.destinations:
        tp_dest = create_tpdest(tp_id, dest_id, date)
        return tp_dest
    
    return "Already in your travelplanner"





def remove_destination(tp_dest):
    """Deletes a tp_dest from database to remove connection beteween """

    db.session.delete(tp_dest)
    db.session.commit()




# Api calls for embassy website links and previews per destination

def create_usembassy_website(embassy):
    """Gets calls from api to use in embassy websites for us embassies"""
    
    country_name = embassy.destination.country_name
    name = country_name.lower()
    res = requests.get(f'https://restcountries.com/v3.1/name/{name}')

    response = res.json()

    if response:
        results = response[0]
      
        country_code = results['cca2']
        
        country_code = country_code.lower()
        url = f"https://{country_code}.usembassy.gov"
        embassy.website = url
        
        db.session.commit()
        return True
    return False



def get_link_preview(url, user, country_name):
  """Produces the info necessary to view a preview"""
 

  if user.home_country == 'United States':
      if country_name in us_linkpreview:
          return us_linkpreview[country_name]
      else:
        
          response = requests.get(f"http://api.linkpreview.net/?key={link_preview}&q={url}")
          res = response.json()
          us_linkpreview[country_name] = res
          return res

  if user.home_country == 'Canada':
      if country_name in ca_linkpreview:
          return ca_linkpreview[country_name]
      else:
        
          response = requests.get(f"http://api.linkpreview.net/?key={link_preview}&q={url}")
          res = response.json()
          ca_linkpreview[country_name] = res
          return res

  if user.home_country == 'United Kingdom':
      if country_name in uk_linkpreview:
          return uk_linkpreview[country_name]
      else:
        
          response = requests.get(f"http://api.linkpreview.net/?key={link_preview}&q={url}")
          res = response.json()
          uk_linkpreview[country_name] = res
          return res



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


def get_emer_num(country_name):
    """Gets emergency info for specific countries based on country_code"""
    numbers = {}
    with open('static/databases/emergency_nums.csv') as emergency_nums:
        for location in emergency_nums:
            country, police, ambulance, fire = location.rstrip().split(',')
        
            if country.replace("\"", "").lower() == country_name.lower():
                numbers['ambulance'] = ambulance.replace("\"", "")
                numbers['fire'] = fire.replace("\"", "")
                numbers['police'] = police.replace("\"", "")
                
    return numbers



def get_country_code_currency(country_name):
    """Gets calls from api to use in get_country_currency"""
    if country_name in [ "England", "Scotland", "Wales"]:
      country_name = "United Kingdom"
    
    name = country_name.lower()
    res = requests.get(f'https://restcountries.com/v3.1/name/{name}')
    country_code = False
    response = res.json()
    if response:
      for res in response:
        if res['name']['common'] == country_name:
                country_code = res['cca2']
            
                
   
    return country_code



def get_country_currency(country_code):
    """Gets call from API to use in get_currency_rate """
    res = requests.get(f'https://restcountries.com/v3.1/alpha/{country_code}')

    response = res.json()
    
    results = response[0]

    currency_info = []
   
    if len(results['currencies']) > 1:
        for currency in results['currencies']:
            currency_info.append([currency, results['currencies'][currency]['name'], results['currencies'][currency]['symbol']])
    else:
        curr = results['currencies']
        keys = list(curr.keys())
        key = keys[0]
        currency_info.append([key, curr[key]['name'], curr[key]['symbol']])
    

    return(currency_info)



def get_currency_rate(home_currency, country_currency, amount = 1):
    """Takes in list of currencies and runs them through currency api"""
    exchange_rate = {}
    original = home_currency[0][0]
    if len(country_currency) > 1:
      desired = country_currency[0]
      

    else:
      desired = country_currency[0][0]
      
      

    url = f'https://freecurrencyapi.net/api/v2/latest?apikey={CURRENCY_KEY}&base_currency={original}'

    response = requests.request("GET", url)
    result = response.json()
    
    for currency in result['data']:
      if currency == desired:
        exchange_rate[desired] = result['data'][currency]
        return exchange_rate
    exchange_rate[desired] = 'Sorry! having trouble finding currency info!'
    return exchange_rate





# Embassies

def get_all_embassies():
    """Gets all embassies"""
    return Embassy.query.all()



def get_relevant_embassies(dest, user):
    """Takes in an instance of a destination 
        to return a list of embassies related
        to destination and user"""

    relevant_embassies = set()

    user_embassies = Embassy.query.options(db.joinedload('destination')).filter(Embassy.home_country == user.home_country).all()
    for embassy in user_embassies:
        if embassy.destination.country_name.lower() == dest.country_name.lower():
            relevant_embassies.add(embassy)
        

    return relevant_embassies


def get_home_embassy(dest, embassies):
    places = []
    
   
    for place in embassies:
        if place.destination.city_name == dest.city_name: 
          places.append(place)
    set(places)
    return list(places)
    





# Travel_planner

def get_travelplanner_by_id(tp_id):
    return Travel_planner.query.get(tp_id)



def check_for_repeats(name, user_id):
    """Checks for repeats travelplanners"""
    user = get_user_by_id(user_id)
    tps = user.travel_planner
    
    for tp in tps:
        if tp.name == name:
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
          
          name = title[0].strip()
          
      
          if name == country_name:

              advisory = f"Travel Advisory: {warning}"

  elif home_country == 'Canada':


    res = requests.get('https://data.international.gc.ca/travel-voyage/index-alpha-eng.json')    

    response = res.json()
    results = response['data']

    for result in results:
      if results[result]["country-eng"] == country_name:
        advisory = f"Travel Advisory: {results[result]['eng']['advisory-text']}"
        
  else:
    
    advisory = f"Uk.gov Travel Advisory website for {country_name}:"

  return advisory



def get_advisory_url(country_name, user):
    """Rerieves the url links to gov pages with more info for country name"""
    url = None
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
    
    else:
      country = country_name.replace(" ", "-").lower()

      url = f"https://www.gov.uk/foreign-travel-advice/{country}"
   

    return url



#  weather api call inside travel_planners

def add_icon(weather_desc, day_night = 'day'):
    """Adds icons to the list of weather"""
    desc = weather_desc.strip().split(" ")
    day_icons = {
      "clouds"  : '/static/layout/weather_icons/cloudy-weather-svgrepo-com.svg',
      "overcast": '/static/layout/weather_icons/clouds.svg',
      "default": '/static/layout/weather_icons/weather-sunny-svgrepo-com.svg',
      'drizzle' : '/static/layout/weather_icons/cloud-drizzle.svg',
      'rain': '/static/layout/weather_icons/cloud-rain-heavy.svg',
      'snow': '/static/layout/weather_icons/cloud-snow.svg'
    }
    night_icons = {
      "clouds"  : '/static/layout/weather_icons/cloudy-weather-svgrepo-com.svg',
      "overcast": '/static/layout/weather_icons/clouds.svg',
      "default": '/static/layout/weather_icons/moon-stars.svg',
      'drizzle' : '/static/layout/weather_icons/cloud-drizzle.svg',
      'rain': '/static/layout/weather_icons/cloud-rain-heavy.svg',
      'snow': '/static/layout/weather_icons/cloud-snow.svg'
    }

    if day_night == 'night':
      for forecast in night_icons.keys():
        if desc[0] == 'overcast':
          icon = night_icons['overcast']
          return icon
        else:
           for word in desc:
            if word == forecast:
              icon = night_icons[forecast]
              return icon
        
      icon = night_icons['default']

    else:
      for forecast in day_icons.keys():
        if desc[0] == 'overcast':
          icon = day_icons['overcast'] 
          return icon
        else:
           for word in desc:
            if word == forecast:
              icon = day_icons[forecast]
              return icon
      icon = day_icons['default']
    return icon


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



def extract_weather_info(results, user):
    """Takes in the json of the weather data and extracts relevant info
       returns a list of list with the first index is the naming 
       
       example 

    
       {'Wed, Dec 15': [['morning', 'clear sky', 10.3], 
       ['afternoon', 'clear sky', 10.71], ['evening', 
       'clear sky', 9.09]],...'Sun, Dec 19': [['morning', 'clear sky', 8.74], 
       ['afternoon', 'clear sky'], 8.02], ['evening', 'clear sky', 6.02]]}"""
    if user.home_country == 'United States':
        measure = u"\N{DEGREE SIGN}" + "F"
    else:
        measure = u"\N{DEGREE SIGN}" + "C"


    days = {}
    organize = 0
    for result in results:
        time = result['dt_txt'].strip().split()
        date = datetime.strptime(time[0], "%Y-%m-%d")
        day = calendar.day_abbr[date.weekday()]
        month = calendar.month_abbr[date.month]


        description = result['weather'][0]['description']
        
        temp = f"{result['main']['temp']}{measure}"


        if time[1] == '06:00:00':
            icon = add_icon(description)
            morning = ['Morning', description , temp, organize, icon]
            
            if f'{day}, {month} {date.day}' not in days: 
               days[f'{day}, {month} {date.day}'] = []
            
            days[f'{day}, {month} {date.day}'].append(morning)
            organize += 1          
            
        elif time[1] == '12:00:00':
            icon = add_icon(description)
            afternoon = ['Afternoon', description, temp, organize, icon]

            if f'{day}, {month} {date.day}' not in days: 
               days[f'{day}, {month} {date.day}'] = []

            days[f'{day}, {month} {date.day}'].append(afternoon)
            organize += 1
            
        elif time[1] == '18:00:00':
            
            icon = add_icon(description,'night')
            evening = ['Evening', description, temp ,organize ,icon] 

            if f'{day}, {month} {date.day}' not in days: 
               days[f'{day}, {month} {date.day}'] = []

            days[f'{day}, {month} {date.day}'].append(evening) 
            organize += 1
        
    return days



# Call for profile page : photo strip, translataion, Travel news

def retrieve_news_articles(news_source ='cn'):
  """At the moment I have NY Times and Conde Nast travel news
    I want to add in the  ability to choose between the news source"""
  ny_articles = []
  cn_articles = []
  counter =  0
  if news_source == 'ny':
      res = requests.get('https://rss.nytimes.com/services/xml/rss/nyt/Travel.xml')
            

      root = ET.fromstring(res.content)

      
      for article in root.iter("item"):
          if counter == 4:
              break
          ny_article = {}
          title = article.find("title").text
          img = article.find("{http://search.yahoo.com/mrss/}content")
          if img is None:
            continue
          img = article.find("{http://search.yahoo.com/mrss/}content").attrib['url']
          link = article.find("link").text
          description = article.find("description").text
          date = article.find("pubDate").text


          ny_article['title'] = title
          ny_article['img'] = img
          ny_article['link'] = link
          ny_article['desc'] = description
          ny_article['date'] = date
          ny_article['order'] = counter

          ny_articles.append(ny_article)
          counter += 1 
      return ny_articles        
            
  else:

      res = requests.get('https://www.cntraveler.com/feed/rss')
              

      root = ET.fromstring(res.content)
      
      
      for article in root.iter("item"):
          if counter == 4:
              break
          cn_article = {}
          title = article.find("title").text
          img = article.find("{http://search.yahoo.com/mrss/}thumbnail").attrib['url']
          link = article.find("link").text
          description = article.find("description").text
          date = article.find("pubDate").text


          cn_article['title'] = title
          cn_article['img'] = img
          cn_article['link'] = link
          cn_article['desc'] = description
          cn_article['date'] = date
          cn_article['order'] = counter

          cn_articles.append(cn_article)
          counter += 1 
      return cn_articles





def strip_text(img_url, language):
    """This is to pull the text off of the image to translate """

    res =requests.get(f"https://api.ocr.space/parse/imageurl?apikey={OCR_API}&url={img_url}&language={language}")


    response = res.json()
    
    if 'ParsedResults' in response:
      result = response['ParsedResults'][0]['ParsedText']
      result = result.split()
      return " ".join(result)
    results = response['ErrorMessage'][0]
    return results



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
    
    result = res['responseData']['translatedText']
    return result



# Datasets used for language translations
# language codes necessary for strip photo and translation 

def get_photo_lang_options():
    """Gives a dictionary of languges available for photo stripping"""
    lan=    {"Arabic": "ara",
            "Bulgarian": "bul",
            "Chinese (Simplified)": "chs",
            "Chinese (Traditional)": "cht",
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





def transfrom_source_code(raw_source):
  """Because the photo api and the text translator uses different source codes 
    the codes need to be checked and transformed in order to translate
    i.e photo_soucecode = Chinese Simplified: 'chs'
    text_sourcecode = Chinses Simplified 'zh-CN' """

  photocode = get_photo_lang_options()
  textcode = get_languages_text()
  source = False
  if raw_source in photocode.values():
      for key, value in photocode.items():
          if raw_source == value:
            lang_key =  key
          
      for lan in textcode:
          if lan['language'].lower() == lang_key.lower():
              source = lan['code']

  return source






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


def get_countries_and_capitals():
    url ="https://countriesnow.space/api/v0.1/countries/capital"
    payload= {}
    headers ={}
    response = requests.request("GET", url, headers=headers, data=payload)
    results =response.json()
    return results['data']


if __name__ == '__main__':
    from server import app
    connect_to_db(app)

    user = get_user_by_id(11)
  