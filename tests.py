from unittest import TestCase
from server import app
from model import connect_to_db, db, example_data
from flask import session

class Login_Index_test(TestCase):
    """Tests the login page and the renderering of the homepage"""

    def setUp(self):
        """Setup for every test"""
        self.client = app.test_client()

        app.config['TESTING'] = True

    def test_homepage(self):
        """Test for homepage"""

        result = self.client.get("/")
        self.assertIn(b"WELCOME TO TRAVEL BUDDY", result.data)
    
    def test_login(self):
        """Test login page"""

        result= self.client.post("/login",
                                 data = {"email": "test_user1@test.com" ,"password": "test"},
                                 follow_redirects = True)

        self.assertIn(b"Create a new planner", result.data)

