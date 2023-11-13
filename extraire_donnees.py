# -*- coding: utf-8 -*-
"""
Spyder Editor

This is a temporary script file.
"""

import json

# Étape 1: Lire le fichier JSON d'origine
with open('/srv/local/home/fsi.local-cours/Downloads/pourLesEtudiants/yelp_review.json', 'r') as file:
    data = json.load(file)

# Étape 2: Extraire les données nécessaires
nouvelles_donnees = []
for review in data:
    nouvelle_review = {
        "review_id": review["review_id"],
        "user_id": review["user_id"],
        "business_id": review["business_id"],
        "stars": review["stars"],
        "text": review["text"]
    }
    nouvelles_donnees.append(nouvelle_review)

# Étape 3: Écrire dans un nouveau fichier JSON
with open('/srv/local/home/fsi.local-cours/Downloads/pourLesEtudiants/nouveau_yelp_review.json', 'w') as new_file:
    json.dump(nouvelles_donnees, new_file, indent=2)  

# Étape 1: Lire le fichier JSON d'origine
with open('/srv/local/home/fsi.local-cours/Downloads/pourLesEtudiants/yelp_user.json', 'r') as file:
    data = json.load(file)

# Étape 2: Extraire les données nécessaires
nouvelles_donnees = []
for user in data:
    nouveau_user = {
        "user_id": user["user_id"],
        "name": user["name"],
        "friends": user["friends"],
    }
    nouvelles_donnees.append(nouveau_user)

# Étape 3: Écrire dans un nouveau fichier JSON
with open('/srv/local/home/fsi.local-cours/Downloads/pourLesEtudiants/nouveau_yelp_user.json', 'w') as new_file:
    json.dump(nouvelles_donnees, new_file, indent=2)  
    

# Étape 1: Lire le fichier JSON d'origine
with open('/srv/local/home/fsi.local-cours/Downloads/pourLesEtudiants/yelp_restaurants.json', 'r') as file:
    data = json.load(file)

# Étape 2: Extraire les données nécessaires
nouvelles_donnees = []
for restau in data:
    if "attributes" in restau and restau["attributes"] is not None and "Ambience" in restau["attributes"]:
        nouveau_restau = {
            "business_id": restau["business_id"],
            "name": restau["name"],
            "city": restau["city"],
            "address": restau["address"],
            "categories": restau["categories"],
            "ambience" : restau["attributes"]["Ambience"]
            }
    else :
        nouveau_restau = {
            "business_id": restau["business_id"],
            "name": restau["name"],
            "city": restau["city"],
            "address": restau["address"],
            "categories": restau["categories"]
            }   
    nouvelles_donnees.append(nouveau_restau)

# Étape 3: Écrire dans un nouveau fichier JSON
with open('/srv/local/home/fsi.local-cours/Downloads/pourLesEtudiants/nouveau_yelp_restaurants.json', 'w') as new_file:
    json.dump(nouvelles_donnees, new_file, indent=2)  

