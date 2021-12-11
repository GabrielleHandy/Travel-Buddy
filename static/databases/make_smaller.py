import csv
cities_per_country = {}
fixed = []
most_popular = ['Netherlands', 'Poland', 'Canada', 'Portugal', 'Russia', 
                'Malaysia', 'Hong Kong', 'Greece', 'Austria', 'Japan', 
                'South Korea', 'United Kingdom', 'Thailand', 'Germany', 
                'Mexico', 'Turkey', 'Italy', 'China', 'Spain', 'France' ]
f = open('worldcities_smaller.csv', 'w')
with open('worldcities.csv') as file:   
    writer = csv.writer(f)
    for line in csv.reader(file, delimiter=","):
        if line[8] == 'primary':
            fixed.append(line)
            writer.writerow(line)
            cities_per_country[line[4]] = 1
            continue
        else:
            if line[4] not in cities_per_country:
                cities_per_country[line[4]] = 1
                writer.writerow(line)
                fixed.append(line)
                continue
            else:
                cities_per_country[line[4]] += 1
                
                if cities_per_country[line[4]] > 50:
                    if line[4] in most_popular:
                        if cities_per_country[line[4]] < 300:
                            writer.writerow(line)
                            fixed.append(line)
                            continue
                    continue
            
        
      