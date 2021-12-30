import os
import requests
from flask import (Flask, render_template, request, 
                   redirect, session, flash, jsonify,
                   Markup)
from werkzeug.datastructures import FileStorage
import crud
import cloudinary.uploader
from datetime import datetime, date

from model import connect_to_db


app = Flask(__name__)
app.secret_key = os.environ['APP_SECRET_KEY']

HOTEL_KEY = os.environ['HOTEL_KEY']

CLOUDINARY_KEY = os.environ['CLOUDINARY_KEY']
CLOUDINARY_SECRET = os.environ['CLOUDINARY_SECRET']
CLOUD_NAME = "travel-buddy"

@app.route('/')
def homepage():
    """View  homepage."""
    return render_template('homepage.html')

# Login/ Signup  and User verification
   
@app.route('/signup', methods=['POST'])
def create_user():
    """Create Account"""
    fname = request.form.get('fname')
    lname = request.form.get('lname')
    email = request.form.get('email')
    password = request.form.get('password')
    home_country = request.form.get("Nationality")
    user = crud.get_user_by_email(email)
    if user:
        flash('Email already in use. Click button to Sign in')
        return redirect('/')
    else:
        crud.create_user(first_name=fname, last_name=lname, email=email, 
                    password=password, home_country=home_country)
        flash("Welcome Buddy! Click the button to login!")
        return redirect("/")


@app.route('/login', methods=['POST'])
def login_user():
    '''Log in user'''
    email = request.form.get('email')
    password = request.form.get('password')
    user = crud.get_user_by_email(email)
    
    if user:
        if user.password == password:
            flash("Logged in :)")
            session['name' ] = user.fname
            session['user_id'] = user.user_id
            return redirect(f'/profile/{user.fname}')
        else:
            flash("Incorrect password :(")
    else:
        flash("Email does not exist :(")
    return redirect('/')


@app.route('/logout')
def clear_session():
    """ Log user out """
    session.clear()
    return redirect('/')

# profile page routes
@app.route('/profile/<fname>')
def show_profile(fname):
    """View user profile"""
    p_lang = crud.get_photo_lang_options()
    text_lang = crud.get_languages_text()
    user =crud.get_user_by_id(session["user_id"])
    tps = list(user.travel_planner)

    news = crud.retrieve_news_articles()

    return render_template('user_profile.html', 
                            user = user, tps = tps,
                            photo_languages = p_lang,
                            languages = text_lang,
                            news = news)


@app.route('/change_news', methods=['POST'])
def change_news_source():
    """Changes the news source for new feed"""

 
@app.route('/translated_photo', methods=['POST'])
def translate_photo():
    """Takes in photo """
    
   
    photo = request.form.get('photo')
    

    photo_source = request.form.get('source')
    
    
    

    result = cloudinary.uploader.upload(photo,
    api_key=CLOUDINARY_KEY,
    api_secret=CLOUDINARY_SECRET,
    cloud_name=CLOUD_NAME)

    

    img_url = result['secure_url']
    public_id = result['public_id']
    

    striped_text = crud.strip_text(img_url, photo_source)
    cloudinary.uploader.destroy(public_id, api_key=CLOUDINARY_KEY,
    api_secret=CLOUDINARY_SECRET,
    cloud_name=CLOUD_NAME)
    
    return jsonify(striped_text)
    
    
    
@app.route('/translate_text', methods=['POST'])
def translate_text():
    """Translate text from text or photo text"""
    text = request.json.get('text')
    target = request.json.get('target')
    
    raw_source = request.json.get('source')
    transformed_source = crud.transfrom_source_code(raw_source)
    if transformed_source:
        source =transformed_source
    else:
        source = raw_source

    translated = crud.translate(text, target, source)

    return jsonify(translated)




# travelplanner routes 
@app.route('/travel_planner/<tp_id>/<dest_id>')
def show_chosen_planner(tp_id, dest_id):
    """View Travel_Planner by id"""

    # destinations

    tp =crud.get_travelplanner_by_id(tp_id)
    
    destinations = tp.destinations

    base_destination = crud.get_destination_by_id(dest_id)

    country_name = base_destination.country_name

    # advisory alert
    user = crud.get_user_by_id(session['user_id'])
    alert = crud.retrieve_advisory(country_name, user)
    advisory_link = crud.get_advisory_url(country_name, user)
    if advisory_link:
        flash(Markup(f'{alert} <a href={advisory_link} id="advisory-url" class="advisory-link">Click here for information</a>'))
    else:
    
        flash(alert)
    
    # embassy info
    embassies = []
    embassies = crud.get_relevant_embassies(base_destination,user)

    rel_embassy = crud.get_home_embassy(base_destination, embassies)

    if tp.user.home_country == 'United States':
        for embassy in embassies:
            if not embassy.website:
                crud.create_usembassy_website(embassy)

    if rel_embassy:
        embassies.remove(rel_embassy[0])
    
    

    city_name = base_destination.city_name

    # weather api, currency api, hotel api info 
    # weather info saved in session to lower pulls to api
    if city_name in session:
        weather_info =  session[city_name]
        
    else:
        results = crud.get_weather(city_name, tp.user)
        if type(results) is str:
            weather_info = results
        else:    
            weather_info =  crud.extract_weather_info(results)
        session[city_name] = weather_info
      
    # sorted by an organizer counter I put in first array
    weather_info = sorted(weather_info.items(), key=lambda x: x[1][0][3], reverse=False)
    currencies= {'United States': 'USD',
                'United Kingdom': 'EUR',
                'Canada': 'CAD'  
                }
    currency = currencies[tp.user.home_country]
    session['currency'] = currency

    # for the add and delete forms
    today = date.today()
    locations = crud.get_all_destinations()
    return render_template('travelplanner.html', tp = tp, base_dest = base_destination,
                          destinations = destinations, embassies=embassies, today = today,
                          rel_embassy= rel_embassy, weather_info = weather_info, 
                          currency = currency, locations= locations)




@app.route('/emergency_info/<country_name>')
def view_emergency_Info(country_name):
    """View emergency info based on country"""
    

    covid_info= crud.get_covid_info(country_name)
    emer_num= crud.get_emer_num(country_name)

    user = crud.get_user_by_id(session['user_id'])
    advisory_link = crud.get_advisory_url(country_name, user)
    link_preview = crud.get_link_preview
    
    

    pass


@app.route('/new_tp')
def view_travelplanner_form():
    """View Travelplanner Form"""

    destinations = crud.get_all_destinations()

    return render_template('create_travelplanner.html', destinations = destinations)



@app.route("/delete_tp", methods=['POST'])
def delete_travelplanner():
    """Deletes a travel_planner"""

    tp_id = request.json.get('tp_id')

    travel_planner = crud.get_travelplanner_by_id(tp_id)

    response = crud.delete_travelplanner(travel_planner)

    return jsonify(response)




@app.route('/create_travelplanner', methods=['POST'])
def create_travel_planner():

    user_id = session['user_id']
    tp_name = request.form.get('tp_name')
    
    # getting city and country name
    destinations = request.form.get('destinations')
    
    # if destinations:
    destination = destinations.split(",")


    city_name = destination[0]
    country = destination[1]

    # else:
    # check for instance of city, country
    # if not in there:
    #  crud.create_destination(city_name, country)

    dest_id = crud.get_destid_by_location(city_name,country)
    
    


    tp_date = request.form.get('date')
    if len(tp_date) == 0:
        tp_date = None

    # checking for duplicates
    answer = crud.check_for_repeats(tp_name, user_id)
    if answer:
        # store this in a variable to get information to create tp_dest
        travel_planner = crud.create_travelplanner(tp_name,user_id)
        tp_id =travel_planner.tp_id
        crud.create_tpdest(tp_id, dest_id, tp_date)
        flash(f"{tp_name} was successfuly created!!")
    else:
        flash("""Seems like you created this Travel Planner already!""")

    return redirect('/new_tp')


@app.route('/add_dest', methods=['POST'])
def add_dest():
    """Adding a destination to Travel Planner"""
    tp_id = request.form.get('add-tp_id')
    dest_id = request.form.get('destinations')
    dest_date = request.form.get('date')

    
    if len(dest_date) == 0:
        dest_date = None


    response = crud.add_destination(dest_id, tp_id, dest_date)

    if type(response) is str:
        flash(response)
    else:
        flash('Successfully Added!')
    return redirect(f'/travel_planner/{tp_id}/{dest_id}')


@app.route('/remove_dest', methods=['POST'])
def remove_dest():
    """Removing a destination from Travel Planner"""
    tp_id = request.json.get('tp_id')
    dest_id = request.json.get('dest_id')

    travel_planner = crud.get_travelplanner_by_id(tp_id)

    if len(travel_planner.destinations) == 1:
        return jsonify("Travel planners must have atleast one destination. Try removing after adding a new destination.")
    tp_dest = crud.find_tpdest(dest_id, tp_id)
    crud.remove_destination(tp_dest)
    user = crud.get_user_by_id(session['user_id'])
    
    destinations = travel_planner.destinations
    
    dest_destid = destinations[0].dest_id
    

    return jsonify('Sucessful')


# This route is used just for fetching hotel info and protecting the key
@app.route('/find_destid', methods=['POST'])
def hotel_dest_id():
    """Creates a call to hotels.com in order to find dest_id"""
    destination = request.json.get('destination')

    # call for dest_id
    currency = session['currency']
    url = "https://hotels-com-provider.p.rapidapi.com/v1/destinations/search"

    query_string = {'query': f'{destination}', 'currency': f'{currency}', 'locale': 'en_US' }

    headers = {
    'x-rapidapi-key': HOTEL_KEY,
    'x-rapidapi-host': "hotels-com-provider.p.rapidapi.com"
    }

    response = requests.request("GET", url, headers=headers, params= query_string)
    
    return jsonify(response.json())



@app.route('/find_hotels', methods=['POST'])
def display_hotels():
    """Creates a call to hotels.com to find available hotels"""
    dest_id = request.json.get('dest_id')
    checkin = request.json.get('checkin')
    checkout = request.json.get('checkout')
    sort_by = request.json.get('sortBy')
    adult_num = request.json.get('adult_num')
    currency = session['currency']

    url = "https://hotels-com-provider.p.rapidapi.com/v1/hotels/search"

    querystring = {'checkin_date':f'{checkin}','checkout_date':f'{checkout}','sort_order':f'{sort_by}','destination_id':f'{dest_id}','adults_number':f'{adult_num}','locale':'en_US','currency':f'{currency}'}

    headers = {
        'x-rapidapi-key': HOTEL_KEY,
        'x-rapidapi-host': "hotels-com-provider.p.rapidapi.com"
        }

    response = requests.request("GET", url, headers=headers, params=querystring)
    
    return jsonify(response.json())
   

if __name__ == '__main__':
    # DebugToolbarExtension(app)
    connect_to_db(app)
    app.run(host="0.0.0.0", debug=True)
   