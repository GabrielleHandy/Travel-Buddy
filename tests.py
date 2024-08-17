from unittest import TestCase
from server import app
import os
from model import connect_to_db, db, example_data
from flask import session
from datetime import date
import crud
import helper

class LoginIndexTest(TestCase):
    """Tests the login page and the renderering of the homepage"""

    def setUp(self):
        """Setup for every test"""
        self.client = app.test_client()

        app.config['TESTING'] = True

    def test_homepage(self):
        """Test for homepage"""

        result = self.client.get("/")
        self.assertIn(b"Sign in", result.data)
    
    

class FlaskTestsDatabase(TestCase):
    """Flask tests that use the database."""

    def setUp(self):
        """Stuff to do before every test."""

        # Get the Flask test client
        self.client = app.test_client()
        app.config['TESTING'] = True

        # create testdb

        os.system('dropdb testdb')
        os.system('createdb testdb')

        # Connect to test database
        connect_to_db(app, "postgresql:///testdb")

        # Create tables and add sample data
        db.create_all()
        example_data()
        
    def tearDown(self):
        """Do at end of every test."""

        db.session.remove()
        db.drop_all()
        db.engine.dispose()

    def test_login(self):
        """Test login page"""

        result= self.client.post("/login",
                                 data = {"email": "hpendragon@hmc.com" ,"password": "test"},
                                 follow_redirects = True)

        self.assertIn(b"Logout", result.data)

    def test_travelplanner_info(self):
        """Test travelplanner page."""
        # Tests Sophie Hatter travel planner
        with self.client as c:
            with c.session_transaction() as sess:
                sess['user_id'] = 1
        result = self.client.get(f"/travel_planner/{1}/{1}")
        self.assertIn(b"Taiwan", result.data)
    

    def test_find_dest_id(self):
        """Test helper find_dest_id function"""
    
        result = helper.find_dest_id('Tokyo', 'Japan')
        self.assertEqual(result, 2)
    
    def test_alert_message(self):
        """Test helper create_alert function
           also test it shows up on travelplanner page"""
        user = crud.get_user_by_id(1)
        alert = helper.create_alert('Taiwan', user)

        with self.client as c:
            with c.session_transaction() as sess:
                sess['user_id'] = 1

        result = self.client.get(f"/travel_planner/{1}/{1}")
        self.assertIn(alert.encode(), result.data)

    def test_create_travelplanner(self):
        """Creates test travelplanner 
           checks profile page for test"""
        
        with self.client as c:
            with c.session_transaction() as sess:
                sess['user_id'] = 2
        helper.create_travelplanner('Test TP',2, 3, date.today())

        result = self.client.get('/profile/Howl')

        self.assertIn(b"Test TP", result.data)

if __name__ == '__main__':
    import unittest

    unittest.main()