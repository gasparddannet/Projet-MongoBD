# -*- coding: utf-8 -*-
"""
Created on Sat Dec  9 11:48:57 2023

@author: Arthur
"""

import json
from itertools import product


with open('Data/nouveau_yelp_review.json', 'r') as file:
    data_review = json.load(file)
    
with open('Data/nouveau_yelp_restaurants.json', 'r') as file:
    data_restaurant = json.load(file)

review_count_by_business = {}
total_stars_by_business = {}

nouvelles_donnees = []

for review in data_review :
    business_id = review['business_id']
    review_count_by_business[business_id] = review_count_by_business.get(business_id, 0) + 1
    total_stars_by_business[business_id] = total_stars_by_business.get(business_id, 0) + review['stars']


for restaurant in data_restaurant:
    business_id = restaurant["business_id"]
    nb_review = review_count_by_business.get(business_id, 0)
    avg_stars = total_stars_by_business.get(business_id, 0) / nb_review if nb_review > 0 else 0
    
    if "attributes" in restaurant and restaurant["attributes"] is not None and "Ambience" in restaurant["attributes"]:
        
        categories = restaurant.get("categories", [])
        ambiance = restaurant["attributes"].get("Ambience", [])
        restaurant["criteres"] = list(product(categories, ambiance))
    
    restaurant["nb_review"] = nb_review
    restaurant["avg_stars"] = avg_stars

    nouvelles_donnees.append(restaurant)

with open('Data/nouveau_yelp_restaurants.json', 'w') as new_file:
    json.dump(nouvelles_donnees, new_file, indent=2)  
