# -*- coding: utf-8 -*-
"""
Created on Sat Dec  9 11:48:57 2023

@author: Arthur
"""

import json


with open('Data/nouveau_yelp_review.json', 'r') as file:
    data_review = json.load(file)
    
with open('Data/nouveau_yelp_user.json', 'r') as file:
    data_user = json.load(file)
    
with open('Data/nouveau_yelp_restaurants.json', 'r') as file:
    data_restaurant = json.load(file)

review_count_by_business = {}
total_stars_by_business = {}
criteria_by_business = {}
criteria_by_user = {}


nouvelles_donnees = []

for review in data_review :
    business_id = review['business_id']
    stars = review['stars']

    review_count_by_business[business_id] = review_count_by_business.get(business_id, 0) + 1
    total_stars_by_business[business_id] = total_stars_by_business.get(business_id, 0) + stars
    
    user_id = review['user_id']
    restaurant_criteria = criteria_by_business.get(business_id, [])
    
    if user_id not in criteria_by_user:
        criteria_by_user[user_id] = []
    if stars>2.5:
        criteria_by_user[user_id].extend(restaurant_criteria)


for restaurant in data_restaurant:
    business_id = restaurant["business_id"]
    nb_review = review_count_by_business.get(business_id, 0)
    avg_stars = total_stars_by_business.get(business_id, 0) / nb_review if nb_review > 0 else 0
    criteria_by_business[business_id] = restaurant["criteres"]
    
    restaurant["nb_review"] = nb_review
    restaurant["avg_stars"] = avg_stars

    nouvelles_donnees.append(restaurant)

with open('Data/nouveau_yelp_restaurants.json', 'w') as new_file:
    json.dump(nouvelles_donnees, new_file, indent=2)  
    
nouvelles_donnees_user = []

for user in data_user:
    user_id = user["user_id"]
    
    user_criteria = criteria_by_user.get(user_id, [])
    
    user["criteres"] = user_criteria
    nouvelles_donnees_user.append(user)

with open('Data/nouveau_yelp_user.json', 'w') as new_file:
    json.dump(nouvelles_donnees_user, new_file, indent=2)
