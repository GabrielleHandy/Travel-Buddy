import os
import requests
from flask import Flask, render_template, request, redirect, session, flash
from werkzeug.utils import secure_filename
import crud
from model import connect_to_db


app = Flask(__name__)
app.secret_key = 'erwjrkmfw]r77\544rew'
OCR_API = os.environ['OCR_KEY']

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
    print(home_country)
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
    print(email)
    password = request.form.get('password')
    user = crud.get_user_by_email(email)
    
    print(user)
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
    # flash(f"welcome back {fname}")
    user =crud.get_user_by_id(session["user_id"])
    return render_template('user_profile.html', user = user)  

@app.route('/travelplanners')
def show_all_travelplanners():
    """Show a list of all travelplanners"""
    user =crud.get_user_by_id(session["user_id"])
    return render_template('travel_planners.html', user = user)  

# travelplanner routes 
@app.route('/travel_planner/<tp_id>')
def show_chosen_planner(tp_id):
    """View Travel_Planner by id"""
    # flash(f"welcome back {fname}")
    tp =crud.get_travelplanner_by_id(tp_id)
    destinations = tp.destination
    embassies = []
    embassy = []
    if tp.destination.embassies:
        embassy = crud.get_home_embassy(tp)
        if embassy == None:
            embassies = crud.get_relevant_embassies(tp)

            
    
    return render_template('travelplanner.html', tp = tp,
                          destinations = destinations, embassies=embassies, embassy=embassy)  
# @app.route('/recieve_pic', methods=["POST","GET"])
# def show_afterparty_form():

#     if request.form.get('submit') == 'submit':
#         f = request.files['image']
#         print(f)
#         filename = secure_filename(f.filename)
#         print(filename)
#         f.save(os.path.join(app.config['UPLOAD_FOLDER'], filename))
#         print(app.config['UPLOAD_FOLDER'])
    # print(image)
    # url = 'https://api.ocr.space/parse/imageurl'
    # payload = {'apikey': OCR_API}
    # payload['file'] = image

    
    # res = requests.get(url, params = payload)
    
    
    # - Use form data from the user to populate any search parameters
    #
    # - Make sure to save the JSON data from the response to the `data`
    #   variable so that it can display on the page. This is useful for
    #   debugging purposes!
    #
    # - Replace the empty list in `events` with the list of events from your
    #   search results

    # data = res
    # print(data)

# return redirect('/')

if __name__ == '__main__':
    # DebugToolbarExtension(app)
    connect_to_db(app)
    app.run(host="0.0.0.0", debug=True)
   