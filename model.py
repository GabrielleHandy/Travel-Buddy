"""Models for Travel Buddy"""

from flask_sqlalchemy import SQLAlchemy 

db = SQLAlchemy()

class User(db.Model):
    """A user"""

    __tablename__ = 'users'

    user_id = db.Column(db.Integer, 
                        primary_key=True,
                        autoincrement=True)
    fname = db.Column(db.String(30), nullable=False)
    lname = db.Column(db.String(30), nullable=False)
    email = db.Column(db.String(30), unique=True)
    password = db.Column(db.String(30), nullable=False)
    home_country = db.Column(db.String(30), nullable=False)

    travel_planner = db.relationship('Travel_planner', back_populates="user")

    def __repr__(self):
        
        return f'''User user_id:{self.user_id} name:{self.fname} {self.lname} email:{self.email}'''



class Travel_planner(db.Model):
    """A travel planner for user"""

    __tablename__ = 'travelplanners'

    tp_id = db.Column(db.Integer, 
                      primary_key=True, 
                      autoincrement=True)
    name = db.Column(db.String(50),
                     nullable = False)
    user_id = db.Column(db.Integer, db.ForeignKey('users.user_id'))


    user = db.relationship('User', back_populates="travel_planner")
    destinations = db.relationship("Destination",secondary= "tps_dests", back_populates="travel_planners") 
    
    def __repr__(self):
        return f"Travel PLanner tp_id:{self.tp_id} name:{self.name}"


# check your crud.py for necessary changes
class TpDest(db.Model):
    # association table
    """A Travel_planner with more than one destination"""

    __tablename__ = 'tps_dests'

    tpdest_id = db.Column(db.Integer, 
                      primary_key=True, 
                      autoincrement=True)
    dest_id = db.Column(db.Integer, db.ForeignKey('destinations.dest_id'))
    tp_id = db.Column(db.Integer, db.ForeignKey('travelplanners.tp_id'))
    date = db.Column(db.DateTime, nullable = True)

    
    def __repr__(self):
        return f"Tp_Dest tpdest_id: {self.tpdest_id} tp_id:{self.tp_id} dest_id:{self.dest_id}"


class Destination(db.Model):
    """A destination choosen by user"""

    __tablename__ = 'destinations'

    dest_id = db.Column(db.Integer, 
                      primary_key=True, 
                      autoincrement=True)
    city_name = db.Column(db.String(50), nullable = True)
    country_name = db.Column(db.String(100), nullable = False)



    travel_planners = db.relationship('Travel_planner', secondary= "tps_dests", back_populates="destinations")
    embassies = db.relationship('Embassy', back_populates="destination")

    def __repr__(self):
        return f'Destination dest_id:{self.dest_id} Location:{self.city_name or ""},{self.country_name}'


class Embassy(db.Model):
    """An Embassy"""

    __tablename__ = 'embassies'

    embassy_id = db.Column(db.Integer, 
                      primary_key=True, 
                      autoincrement=True)
    home_country = db.Column(db.String(50), nullable = False)
    latitude = db.Column(db.Float, nullable=False)
    longitude = db.Column(db.Float, nullable=False)
    address =db.Column(db.String, nullable=True)
    website= db.Column(db.String, nullable=True)
    dest_id = db.Column(db.Integer, db.ForeignKey('destinations.dest_id'))

    destination = db.relationship('Destination', back_populates="embassies")
    
    def __repr__(self):
        return f"Embassy Embassy_id:{self.embassy_id} Home Country:{self.home_country} Location:{self.address}"


def connect_to_db(flask_app, db_uri="postgresql:///travelbuddy", echo=True):
    flask_app.config["SQLALCHEMY_DATABASE_URI"] = db_uri
    flask_app.config["SQLALCHEMY_ECHO"] = echo
    flask_app.config["SQLALCHEMY_TRACK_MODIFICATIONS"] = False

    db.app = flask_app
    db.init_app(flask_app)

    print("Connected to the db!")

    
if __name__ == "__main__":
    from server import app

    # Call connect_to_db(app, echo=False) if your program output gets
    # too annoying; this will tell SQLAlchemy not to print out every
    # query it executes.

    connect_to_db(app)