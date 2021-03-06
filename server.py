import os
import requests
from flask import (Flask, render_template, request, 
                   redirect, session, flash, jsonify,
                   Markup)
import crud
import cloudinary.uploader
import helper
from datetime import date

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
    if 'name' in session:
        print(session['name'])
        name = session['name']
        return redirect(f'/profile/{name}')
        
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
        flash(Markup("""<div class="alert alert-primary d-flex align-items-center" role="alert">
                    <div>
                        Email already in use.
                    </div>
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>"""))
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
            session['name'] = user.fname
            session['user_id'] = user.user_id
            return redirect(f'/profile/{user.fname}')
        else:
            flash( Markup("""<div class="alert alert-danger d-flex align-items-center" role="alert">
            <div>
                Incorrect password.
            </div>
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>"""))
    else:
        flash( Markup("""<div class="alert alert-danger d-flex align-items-center" role="alert">
            <div>
                Email does not exist. 
            </div>
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>"""))
        
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
    locations = crud.get_all_destinations()
    countries = crud.list_all_countries(locations)

    return render_template('user_profile.html',
                            fname = fname, tps = tps,
                            photo_languages = p_lang,
                            languages = text_lang,
                            news = news, countries = countries)



 
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
    user = crud.get_user_by_id(session['user_id'])

    # destinations

    tp =crud.get_travelplanner_by_id(tp_id)
    
    destinations = tp.destinations

    base_destination = crud.get_destination_by_id(dest_id)

    country_name = base_destination.country_name

    city_name = base_destination.city_name

    # advisory alert
    alert = helper.create_alert(country_name, user)
    
    
    # weather api, currency api, hotel api info below
    
    if city_name in session:

        weather_info =  session[city_name]
        
    else:

        weather_info = helper.get_weather_info(city_name, user)

        # weather info saved in session to lower pulls to api
        session[city_name] = weather_info
      
            
    
    # currency information
    home_country_code = crud.get_country_code_currency(user.home_country)
    home_currency = crud.get_country_currency(home_country_code)

    country_code = crud.get_country_code_currency(base_destination.country_name)

    if country_code:
        country_curr = crud.get_country_currency(country_code)

        currency_rate = helper.get_currency_rate(home_currency, country_curr)

    # Saves home currency for future use
    session['currency'] = home_currency[0][0]

    

    
    # for the add and delete forms
    today = date.today()
    locations = crud.get_all_destinations()
    countries = crud.list_all_countries(locations)
    return render_template('travelplanner.html', alert = alert, tp = tp, base_dest = base_destination,
                          destinations = destinations, today = today,
                          weather_info = weather_info, countries= countries,
                          home_currency = home_currency, country_currency = country_curr,
                          currency_rate = currency_rate)




@app.route('/emergency_info/<tp_id>/<country_name>')
def view_emergency_info(tp_id, country_name):
    """View emergency info based on country"""
    
    tp =crud.get_travelplanner_by_id(tp_id)
   
    emer_num= crud.get_emer_num(country_name)
    
    for dest in tp.destinations:
        if dest.country_name == country_name:
            destination = dest


    user = crud.get_user_by_id(session['user_id'])
    advisory_link = crud.get_advisory_url(country_name, user)
    link_preview = crud.get_link_preview(advisory_link, user, country_name)
    
    # embassy info for embassies in destination country
    embassies = []
    embassies = crud.get_relevant_embassies(destination,user)

    # takes embassies and finds the ones located in city of destination
    rel_embassy = crud.get_home_embassy(destination, embassies)

    # removes city embassy from list of all embassies __avoids repeats__
    if rel_embassy:
        embassies.remove(rel_embassy[0])


    if tp.user.home_country == 'United States':
        helper.create_usembassy_website_link(embassies)
        
    

    return render_template('emergency_info.html', tp = tp, rel_embassy= rel_embassy, 
                            embassies=embassies,destination=destination,
                            emergency_nums= emer_num, link_preview= link_preview)





@app.route("/delete_tp", methods=['POST'])
def delete_travelplanner():
    """Deletes a travel_planner"""

    tp_id = request.json.get('tp_id')

    travel_planner = crud.get_travelplanner_by_id(tp_id)

    response = crud.delete_travelplanner(travel_planner)

    return jsonify(response)




@app.route('/create_travelplanner', methods=['POST'])
def create_travel_planner():
    """Creates a travel planner"""
    user_id = session['user_id']
    tp_name = request.form.get('tp_name')

    city_name = request.form.get('city')
    country = request.form.get('country')
    
    tp_date = request.form.get('date')
    if len(tp_date) == 0:
        tp_date = None

    # checking for duplicates
    no_repeat = crud.check_for_repeats(tp_name, user_id)
    if no_repeat:
        user = crud.get_user_by_id(user_id)
        # check for instance of city, country

        dest_id = helper.find_dest_id(city_name, country)
        


        helper.create_travel_planner(tp_name, user_id, dest_id, tp_date)
        

        flash( Markup(f"""<div class="alert alert-success d-flex align-items-center" role="alert">
            <div>
                {tp_name} was successfuly created!!
            </div>
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>"""))
        
        return redirect(f'/profile/{user.fname}')
    else:
        flash( Markup("""<div class="alert alert-warning d-flex align-items-center" role="alert">
            <div>
                Seems like you created this Travel Planner already!
            </div>
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>"""))
        
    fname = session['name']
    return redirect(f'/profile/{fname}')


@app.route('/add_dest', methods=['POST'])
def add_dest():
    """Adding a destination to Travel Planner"""
    tp_id = request.form.get('add-tp_id')
   
    city_name = request.form.get('city')
    country = request.form.get('country')

    dest_id = helper.find_dest_id(city_name, country)
        
    


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
    connect_to_db(app, echo=True)
    app.run(debug = True)
   