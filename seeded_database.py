"""Seed the database"""
import os
import json, csv
from random import choice, randint, sample
from datetime import datetime
import crud, model, server

os.system('dropdb travelbuddy')
os.system('createdb travelbuddy')

model.connect_to_db(server.app)
model.db.create_all()

# all ciites
countries_capitals= crud.get_countries_and_capitals()  
for country in countries_capitals:
    
    city_name = country["capital"]
    country = country["name"]

    crud.create_destination(city_name, country)


# US embassies

with open('static/databases/usEmbassy.json') as f:
    usembassy_data = json.loads(f.read())

    results = usembassy_data['results']
    stoppers = ['STOP','Tel','Telephone:','Tel:','Phone:', 'Switchboard:', 'International:', 'Call:']

   
    website=None
    
    
    for result in results: 
        home_country = 'United States'
        
        
        country = result['country']
    
        raw_embassy_name =result['embassy'].split(" ")
        
        city_name = []
        for i in range(len(raw_embassy_name)):
            if  raw_embassy_name[i] in city_name:
                break


            
            if 'in' == raw_embassy_name[i]:
                for j in raw_embassy_name[i + 1::]:
                    city_name.append(j)
                break
            
            elif  raw_embassy_name[i] == country:
                city_name.append(raw_embassy_name[i])
                if len (raw_embassy_name[i::]) > 1 :
                    if raw_embassy_name[i + 1] == 'City':
                        city_name.append(raw_embassy_name[i + 1])
                        break
            else:
                if i == (len(raw_embassy_name) - 1):
                    city_name = str(raw_embassy_name[-1])
                    

        if type(city_name) is list and len(city_name )> 1:
            city_name = " ".join(city_name)
     
        else:
            if type(city_name) is list:
                city_name = city_name[0]



        # This is to strip the info section in csv to just give the adress.
        # Sadly the whole info section is one long list
        raw_address = result['info'].split()
        address = []
        for word in raw_address:
            if word.capitalize() == country:
                address.append(word)
                break 
        
            elif word in stoppers:
                break
    
            address.append(word)
            
        if len(address) > 1:
            address=  " ".join(address)
        else:
            address = None
        

        if 'geoPosition' in result:      
            lat = result['geoPosition']['latitude']
            lng= result['geoPosition']['longitude']

        else:
            if address is None:
                continue

        geocode = crud.add_geocode(address)

        if geocode == []:
            continue
        
        lat = geocode['lat']
        lng = geocode['lng']


        
        crud.create_embassy(home_country, country, 
                                        lat, lng, city_name, address, website)
            


#Canadian Embassies 

with open('static/databases/caEmbassy.json') as j:
    caembassy_data = json.loads(j.read())

    results =  caembassy_data['data'] 
    result = results.items()
    embassy_info = list(result)

    address=None
    website=None
    for i in range(len(embassy_info)):
        offices = embassy_info[i][1]['offices']
        for office in offices:
            if office['lat'] != '': 
                home_country = 'Canada'
                country = office['eng']['country']     
                lat = float(office['lat'])
                lng = float(office['lng'])
                city_name = office['eng']['city'] 
                if office['eng']['address'] != '':
                    address = office['eng']['address']
                if office['eng']['internet'] != '':
                    website = office['eng']['internet']
            
                already_exist = crud.get_destid_by_location(city_name, country)
                if not already_exist:
                    crud.create_destination(city_name, country)


                crud.create_embassy(home_country, country, 
                                    lat, lng, city_name,
                                    address, website)


#British EMbassies

with open('static/databases/FCO_posts_overseas_18_October_2019.csv') as file:
    
    city_name = None
    address=None
    website=None 

    for line in csv.reader(file, delimiter=","):
        if 'Region' in line:
            continue
        elif line[0] == 'Multilateral':
            continue
        else:
            home_country = 'United Kingdom'
            country = line[1]
            lat = float(line[4])
            lng = float(line[5])
            address = crud.add_address(lat,lng)
            city_name = line[2]


            already_exist = crud.get_destid_by_location(city_name,country)

            if not already_exist:
                crud.create_destination(city_name, country)

            crud.create_embassy(home_country, country, 
                                    lat, lng, city_name,
                                    address, website)

# test_users

locations = crud.get_all_destinations()
for i in range(10):
    home_country = choice(['United States', 'Canada', 'United Kingdom'])
    
    user = crud.create_user(first_name = f'test_user{i+1}', 
                last_name ='Test', email =f'test_user{i+1}@test.com', 
                password = 'test', home_country = home_country)

    first_name = f'test_user{i+1}'
    travelplanners = randint(1,3)
    j = 1
    num_selected = randint(1,3)
    
    for travel_planner in range(travelplanners):
        name = f"{first_name}'s Travel_planner test {j}"
        user_id = user.user_id
        

        selected_dest = sample(locations, num_selected)

        tp = crud.create_travelplanner(name,user_id)

        for dest in selected_dest:
            year = randint(2022, 2030)
            month = randint(1, 12)
            day = randint(1, 27)

            date = datetime(year, month, day)
            crud.create_tpdest(tp.tp_id, dest.dest_id, date)

        j+=1

print("finished!")
