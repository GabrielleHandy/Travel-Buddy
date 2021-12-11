'''CRUD operations'''
from model import db,connect_to_db, User, Travel_planner, Destination, Embassy
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
def get_everything_but_capitals():
    return Destination.query.filter(Destination.capital == False).all()


# Embassies

def get_all_embassies():
    """Gets all embassies"""
    return Embassy.query.all()


def get_relevant_embassies(tp):
    """Takes in an instance of a travelplanner 
        to return a list of embassies related
        to destination and user"""
    destination = tp.destination
    user = tp.user
    relevant_embassies = Embassy.query.filter(Embassy.home_country == f'{user.home_country}', Embassy.country_name == f'{destination.country_name}').all()
        
    
    return relevant_embassies

def get_home_embassy(tp):

    embassy = tp.destination.embassies
    places = []
    embassies = []
    if embassy is list:
        for place in embassy:
            if embassy.home_country == tp.user.home_country: 
                places.append(embassy)
                return places
    elif embassy.home_country == tp.user.home_country:
        places.append(embassy)
        return places
    else:
        return None
# Travel_planner

def get_travelplanner_by_id(tp_id):
    return Travel_planner.query.get(tp_id)

#Destinations

def get_destination_by_id(dest_id):
    return Destination.query.get(dest_id)

def add_destination(dest_id, tp_id):  
    travel = get_travelplanner_by_id(tp_id)
    new_dest= get_destination_by_id(dest_id)
    if new_dest not in travel.destination:
        travel.destination.append(new_dest)
        return travel.destination
    else:
        return "Already in your travelplanner"
















if __name__ == '__main__':
    from server import app
    connect_to_db(app)