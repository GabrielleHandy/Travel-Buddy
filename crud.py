'''CRUD operations'''
from model import db,connect_to_db, User, Travel_planner, Destination, Embassy
import requests
import os
from datetime import datetime 
import calendar
import xml.parsers.expat
from xml.etree import ElementTree as ET

google_key = 'AIzaSyDGFnnxaxYd_2SHJ9jEPUjzEOJTDIkKoPs'
WEATHER_KEY = os.environ['WEATHER_KEY']
# This section is for creating instances of 
# USER, TRAVEL_PLANNER, DESTINATION, OR EMBASSY
def create_user(first_name, last_name, email, password, home_country):
    """Create and return a new user."""

    user = User(fname= first_name, lname= last_name, 
                email=email, password=password, home_country=home_country)

    db.session.add(user)
    db.session.commit()

    return user


def create_travelplanner(name,user_id, dest_id, date = None):
    """Creates a new Travel planner for user."""
   
    travel_planner = Travel_planner(name= name, user_id= user_id, 
                                    dest_id=dest_id, date = date)

    db.session.add(travel_planner)
    db.session.commit()

    return travel_planner


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

    dest = Destination.query.filter(Destination.city_name == city_name, Destination.country_name == country).first()
    dest_id = dest.dest_id
    return dest_id

def list_all_countries(list_dest):
    """Creates a list of available countries 
    for the select menu in create a travelplanner
    
    takes in a list of all destinations"""
    
    
    list_countries = set()
    for country in list_dest:
        list_countries.add(country.country_name)

    return list_countries


# def add_destination(dest_id, tp_id):  
#     travel = get_travelplanner_by_id(tp_id)
#     new_dest= get_destination_by_id(dest_id)
#     if new_dest not in travel.destination:
#         travel.destination.append(new_dest)
#         return travel.destination
#     else:
#         return "Already in your travelplanner"


# Embassies

def get_all_embassies():
    """Gets all embassies"""
    return Embassy.query.all()


def get_relevant_embassies(tp):
    """Takes in an instance of a travelplanner 
        to return a list of embassies related
        to destination and user"""

    relevant_embassies = set()
    tp_destination = tp.destination
    user = tp.user
    user_embassies = Embassy.query.options(db.joinedload('destination')).filter(Embassy.home_country == user.home_country)
    for embassy in user_embassies:
        if embassy.destination.country_name == tp_destination.country_name:
            relevant_embassies.add(embassy)
        
    
    return relevant_embassies

def get_home_embassy(tp):

    embassy = tp.destination.embassies
    places = []
    
   
    for place in embassy:
        if place.home_country == tp.user.home_country: 
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
def retrieve_advisory(country_name):
    advisory = 'No Travel Advisory for this location'

    
   
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

            advisory = warning
    # elif home_country == 'Canada':       

    #     res = requests.get('https://data.international.gc.ca/travel-voyage/index-alpha-eng.json')    

    #     response = res.json()
    #     print(response)
    return advisory
    
   




#  weather api call inside travel_planners
def get_weather(city_name, user):
    default_unit = 'metric'
    if user.home_country == 'United States':
        default_unit = 'imperial'
       
    res = requests.get(f'http://api.openweathermap.org/data/2.5/forecast?q={city_name}&units={default_unit}&appid={WEATHER_KEY}')
    result = res.json()
    results = result['list']

    return results

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

            morning = ['morning', result['weather'][0]['description'], result['main']['temp'], organize]
            
            if f'{day}, {month} {date.day}' not in days: 
               days[f'{day}, {month} {date.day}'] = []
            
            days[f'{day}, {month} {date.day}'].append(morning)
            organize += 1          
            
        elif time[1] == '12:00:00':
            afternoon = ['afternoon', result['weather'][0]['description'], result['main']['temp']]

            if f'{day}, {month} {date.day}' not in days: 
               days[f'{day}, {month} {date.day}'] = []

            days[f'{day}, {month} {date.day}'].append(afternoon)
            
        elif time[1] == '18:00:00':
            evening = ['evening', result['weather'][0]['description'], result['main']['temp']] 

            if f'{day}, {month} {date.day}' not in days: 
               days[f'{day}, {month} {date.day}'] = []

            days[f'{day}, {month} {date.day}'].append(evening) 
            
        
    return days



















if __name__ == '__main__':
    from server import app
    connect_to_db(app)

    useer = get_user_by_id(1)
    