import crud
from flask import Markup


def get_weather_info(city_name, user):
    """Calls for weather info and then sorts information in order"""

    results = crud.get_weather(city_name, user)
    if type(results) is str:

        weather_info = results
    else:  

        weather_info =  crud.extract_weather_info(results, user)

        # weather is sorted by an organizer counter I put in each list
        weather_info = sorted(weather_info.items(), key=lambda x: x[1][0][3], reverse=False)

    return weather_info


def get_currency_rate(home_currency,country_curr):
    """Calls for currency rates"""

    
    if len(country_curr) > 1:
        currency_rate = []
        for curr in country_curr:
            rate = crud.get_currency_rate(home_currency, curr)
            currency_rate.append(rate)
    else:
        currency_rate = crud.get_currency_rate(home_currency, country_curr)

    return currency_rate

def create_usembassy_website_link(embassies):
    """Creates website url from base I created through research"""

    for embassy in embassies:
        if not embassy.website:
            crud.create_usembassy_website(embassy)

def create_alert(country_name, user):
    """Creates alert from sourced from various sources
       and creates a link to source website if available"""

    alert = crud.retrieve_advisory(country_name, user)
    advisory_link = crud.get_advisory_url(country_name, user)
    if advisory_link:
        alert = (Markup(f'{alert} <a target="_blank" href={advisory_link} id="advisory-url" class="alert-link">Click here for information</a>'))

    return alert

def create_travelplanner(tp_name, user_id, dest_id, tp_date):
    """Creates a travel_planner and destination in travelplanner"""
    travel_planner = crud.create_travelplanner(tp_name,user_id)
    tp_id =travel_planner.tp_id
    crud.create_tpdest(tp_id, dest_id, tp_date)

def find_dest_id(city_name, country):
    """Searches for destination by dest_id if not there creates a new destination in database"""
    dest_id = crud.get_destid_by_location(city_name, country)
        
    if not dest_id:
        new_dest = crud.create_destination(city_name, country)
        dest_id = new_dest.dest_id

    return dest_id
