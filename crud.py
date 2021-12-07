'''CRUD operations'''
from model import db,connect_to_db, User, Travel_planner, Destination, Embassy

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

















if __name__ == '__main__':
    from server import app
    connect_to_db(app)