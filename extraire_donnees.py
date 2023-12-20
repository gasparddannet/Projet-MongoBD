import json
import ast


# Lire le fichier yelp_review d'origine
with open('Data/yelp_review.json', 'r') as file:
    data = json.load(file)

# Extraire les données nécessaires dans nouveau_yelp_review
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

with open('Data/nouveau_yelp_review.json', 'w') as new_file:
    json.dump(nouvelles_donnees, new_file, indent=2)  

#################################################################################################
# Lire le fichier yelp_user d'origine
with open('Data/yelp_user.json', 'r') as file:
    data = json.load(file)

# Extraire les données nécessaires dans nouveau_yelp_user
nouvelles_donnees = []
for user in data:
    nouveau_user = {
        "user_id": user["user_id"],
        "name": user["name"],
        "friends": user["friends"],
        "nbFriends" : len(user["friends"]),
    }
    nouvelles_donnees.append(nouveau_user)

# Étape 3: Écrire dans un nouveau fichier JSON
with open('Data/nouveau_yelp_user.json', 'w') as new_file:
    json.dump(nouvelles_donnees, new_file, indent=2)  
    

#################################################################################################
# Lire le fichier yelp_restaurants d'origine
with open('Data/yelp_restaurants.json', 'r') as file:
    data = json.load(file)

# Extraire les données nécessaires dans nouveau_yelp_restaurants
nouvelles_donnees = []
for restau in data:
    criteres = restau["categories"].split(", ")
    
    if "attributes" in restau and restau["attributes"] is not None and "Ambience" in restau["attributes"] and restau["attributes"]["Ambience"] is not None:
        str_dict = restau["attributes"]["Ambience"]
        dict1 = ast.literal_eval(str_dict)
        nb = 0
        if dict1 is not None:
            for (cle, valeur) in dict1.items():
                if valeur:
                    nb +=1
                    criteres.append(cle)
        nouveau_restau = {
            "business_id": restau["business_id"],
            "name": restau["name"],
            "city": restau["city"],
            "address": restau["address"],
            "categories": restau["categories"],
            # "ambience" : restau["attributes"]["Ambience"],
            "nbAmbience" : nb,
            "criteres" : criteres
            }
    else :
        nouveau_restau = {
            "business_id": restau["business_id"],
            "name": restau["name"],
            "city": restau["city"],
            "address": restau["address"],
            "categories": restau["categories"],
            "nbAmbience" : 0,
            "criteres" : criteres
            }   
    nouvelles_donnees.append(nouveau_restau)

with open('Data/nouveau_yelp_restaurants.json', 'w') as new_file:
    json.dump(nouvelles_donnees, new_file, indent=2)  

