"""Seed the database"""
import os
import json, csv
from random import choice, randint
from datetime import datetime
import crud, model, server

os.system('dropdb travelbuddy')
os.system('createdb travelbuddy')

model.connect_to_db(server.app)
model.db.create_all()

# all ciites
with open('static/databases/worldcities_smaller.csv') as file:
    
    for line in csv.reader(file, delimiter=","):
        city_name = line[0]
        country = line[4]

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
        if 'geoPosition' in result:      
            lat = result['geoPosition']['latitude']
            lng= result['geoPosition']['longitude']
        else:
            lat = 1
            lng= 1
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


        raw_embassy_name =result['embassy'].split()
        print(raw_embassy_name)
        city_name = []
        for i in range(len(raw_embassy_name)):
            if 'in' == raw_embassy_name[i]:
                for j in raw_embassy_name[i + 1::]:
                    city_name.append(j)
            if  raw_embassy_name[i] in city_name:
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
                    print(city_name) 

        if type(city_name) is list and len(city_name )> 1:
                city_name = " ".join(city_name)
                print(city_name)
        else:
           if type(city_name) is list:
                city_name = city_name[0]
                
                print(city_name)
                    
        crud.create_embassy(home_country, country, 
                                    lat, lng, city_name,
                                    address, website)
            


# #Canadian Embassies 

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

            crud.create_embassy(home_country, country, 
                                lat, lng, city_name,
                                address, website)


#British EMbassies

# with open('static/databases/FCO_posts_overseas_18_October_2019.csv') as file:
    
#     city_name = None
#     address=None
#     website=None 

#     for line in csv.reader(file, delimiter=","):
#         if 'Region' in line:
#             continue
#         elif line[0] == 'Multilateral':
#             continue
#         else:
#             home_country = 'United Kingdom'
#             country = line[1]
#             lng = float(line[4])
#             lat = float(line[5])
#             city_name = line[2]
#             crud.create_embassy(capitals, home_country, country, 
#                                     lat, lng, city_name,
#                                     address, website)

# test_users

locations = crud.get_all_destinations()
for i in range(10):
    home_country = choice(['United States', 'Canada'])
    
    crud.create_user(first_name = f'test_user{i+1}', 
                last_name ='Test', email =f'test_user{i+1}@test.com', 
                password = 'test', home_country = home_country)

    first_name = f'test_user{i+1}'
    travelplanners = randint(1,3)
    j = 1
    used_dest_id = []
    for travel_planner in range(travelplanners):
        name = f"{first_name}'s Travel_planner test {j}"
        user_id = f'{i + 1}'
        dest_id = choice(locations).dest_id

        while dest_id in used_dest_id:
            dest_id = choice(locations).dest_id

        used_dest_id.append(dest_id)    
        crud.create_travelplanner(name,user_id, dest_id, date = None)

        j+=1

print("finished!")
