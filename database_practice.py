# file = open('database_of_embassies.csv')
# count = 0
# dictionary = {}
# lines = []
# for line in file:
#     lines.append(line.rstrip().split(";"))

# regulator = lines[0]
# example = lines[1]
# ('operator', 'Afghanistan')
# ('operatorQID', 'http://www.wikidata.org/entity/Q889')
# ('jurisdictions', ['Australia', 'New Zealand', 'Fiji'])
# ('jurisdictionQIDs', ['http://www.wikidata.org/entity/Q408', 'http://www.wikidata.org/entity/Q664', 'http://www.wikidata.org/entity/Q712'])
# ('country', 'Australia')
# ('countryQID', 'http://www.wikidata.org/entity/Q408')
# ('city', 'Canberra')
# ('cityQID', 'http://www.wikidata.org/entity/Q3114')
# ('address', '')
# ('latitude', '-35.32355')
# ('longitude', '149.09222')
# ('phone', '')
# ('email', '')
# ('website', 'https://www.canberra.mfa.af/')
# ('facebook', '')
# ('twitter', '')
# ('youtube', '')
# ('picture', 'http://commons.wikimedia.org/wiki/Special:FilePath/Afghan%20Embassy%20in%20Canberra.jpg')
# ('pictureAuthor', 'Kransky')
# ('pictureLicense', 'Public domain')
# ('pictureLicenseURL', '')
# ('type', 'embassy')
# ('typeQID', 'http://www.wikidata.org/entity/Q3917681')
# ('creation', '')
# ('QID', 'http://www.wikidata.org/entity/Q106450319')

# for i in range(len(example)):
#     dictionary[regulator[i]] = example[i]
#     dictionary['jurisdictions'] = dictionary.get('jurisdictions').split("|")
#     dictionary['jurisdictionQIDs'] = dictionary.get('jurisdictionQIDs').split("|")
# for item in dictionary.items():
#     print(item)

def embassy_search(yourcountry, destinationcountry = ""):
    lines = []
    with open('database_of_embassies.csv') as file:
        for line in file:
            lines.append(line.rstrip().split(";"))
    for embassy in lines:
        locations = [] 
        if embassy[0] == yourcountry:
            # locations. append(embassy[2].split("|"))
            # if destinationcountry not in locations:
            #     print(f"No Embassy Here! Embassy Locations: {locations}")
            # else:
            if destinationcountry == "":
                print(f"{embassy[6]},{embassy[4]} Address: {embassy[8]} Website: {embassy[13]}")
            elif destinationcountry == embassy[4]:
                
                print(f"{embassy[6]},{embassy[4]} Address: {embassy[8]} (lat-{embassy[9]}, log-{embassy[10]}) Website: {embassy[13]}")
        else:
            continue

embassy_search('United States of America', 'Canada')