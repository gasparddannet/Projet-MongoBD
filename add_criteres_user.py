# -*- coding: utf-8 -*-
"""
Created on Sat Dec  9 12:55:23 2023

@author: Arthur
"""

import json

with open('Data/nouveau_yelp_review.json', 'r') as file:
    data_review = json.load(file)

with open('Data/nouveau_yelp_user.json', 'r') as file:
    data_user = json.load(file)

with open('Data/nouveau_yelp_restaurants.json', 'r') as file:
    data_restaurant = json.load(file)

criteria_by_business = {}

for restaurant in data_restaurant:
    business_id = restaurant["business_id"]
    criteria_by_business[business_id] = restaurant["criteres"]

criteria_by_user = {}

for review in data_review:
    user_id = review['user_id']
    business_id = review['business_id']
    stars = review['stars']
    restaurant_criteria = criteria_by_business.get(business_id, [])
    
    if user_id not in criteria_by_user:
        criteria_by_user[user_id] = []
    if stars>2.5:
        criteria_by_user[user_id].extend(restaurant_criteria)

nouvelles_donnees_user = []

for user in data_user:
    user_id = user["user_id"]
    
    user_criteria = criteria_by_user.get(user_id, [])
    
    user["criteres"] = user_criteria
    nouvelles_donnees_user.append(user)

with open('Data/nouveau_yelp_user.json', 'w') as new_file:
    json.dump(nouvelles_donnees_user, new_file, indent=2)
