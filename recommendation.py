# -*- coding: utf-8 -*-
"""
Created on Sat Dec  9 18:47:08 2023

@author: Arthur
"""

from pymongo import MongoClient
from nltk.tokenize import word_tokenize

try :
    conn = MongoClient()    
    print("Connected successfully !")
except :
    print("Could not connect to MongoDB")
    
# database name:mydatabase 
db = conn.test

# collections
restaurant_collection = db.yelp_restaurants
user_collection = db.yelp_user
review_collection = db.yelp_review

# coefficients
ALPHA = 0.30
BETA = 0.35
GAMMA = 0.20
LAMBDA = 0.15

def jaccard(set1, set2):
    intersection_size = len(set1.intersection(set2))
    union_size = len(set1.union(set2))
    return intersection_size / union_size if union_size > 0 else 0

def fa(r):

    r_info = restaurant_collection.find_one({"business_id": r})
    # r_info = restaurant_collection.find({})
    avg_stars = r_info.get("avg_stars", 0)
    nb_review = r_info.get("nb_review", 0)

    max_nb_review = restaurant_collection.find_one(sort=[("nb_review", -1)])["nb_review"]

    appreciation_factor = (avg_stars * nb_review) / (5 * max_nb_review)

    return appreciation_factor

def fp(u, r):
    u_criteria = user_collection.find_one({"user_id": u}).get("criteres", [])
    r_criteria = restaurant_collection.find_one({"business_id": r}).get("critères", [])

    return jaccard(set(u_criteria),set(r_criteria))

def fs(u, r):
    u_friends = user_collection.find_one({"user_id": u}).get("friends", [])

    if not u_friends:
        return 0

    ratings = []
    for friend_id in u_friends:
        friend_rating = review_collection.find_one({"user_id": friend_id, "business_id": r})
        if friend_rating:
            ratings.append(friend_rating["stars"])

    social_factor = sum(ratings) / len(ratings) if len(ratings) > 0 else 0

    return social_factor

def fc(u, r):
    delta_u = review_collection.find({"user_id": u, "stars": 5.0})#.get("business_id")
    ypsilon_r = review_collection.find({"business_id": r, "text": {"$exists": True}})
    print(delta_u)
    max_jacc = 0
    for r1 in delta_u :
        review_u_r1 = review_collection.find_one({"user_id": u, "business_id": r1["business_id"]})
        if "text" in review_u_r1 :
            v_u_r1 = set(word_tokenize(review_u_r1["text"].lower()))
        else :
            continue
        for u1 in ypsilon_r :
            review_u1_r = review_collection.find_one({"user_id": u1["user_id"], "business_id": r})
            if "text" in review_u1_r :
                v_u1_r = set(word_tokenize(review_u1_r["text"].lower()))
                jacc = jaccard(v_u_r1,v_u1_r)
                max_jacc = max(max_jacc,jacc)
            else : 
                continue
            
    return max_jacc
    
def score(u, r) :
    return ALPHA * fa(r) + BETA * fp(u, r) + GAMMA * fs(u, r) + LAMBDA * fc(u, r)

def recommendation(u, v) :
    restau_in_v = restaurant_collection.find({"city": { "$regex": v, "$options": "i" }})
    score_per_r = {}
    for restau in restau_in_v :
        r = restau["business_id"]
        name = restau["name"]
        score_per_r[name] = score(u,r)
    sorted_score_per_r = dict(sorted(score_per_r.items(), key=lambda item:item[1], reverse=True))
    compt = 0
    print ("Recommandations pour la ville  ",v)
    for r, s in sorted_score_per_r.items() :
        if compt > 19 :
            break
        print("   rang ", compt+1, "   ",r,"  score = ",s)
        compt += 1

recommendation("kLm3B6LeboEZWX_4otpILA","Greenville")
recommendation("kLm3B6LeboEZWX_4otpILA","Newark")
recommendation("IpLRJY4CP3fXtlEd8Y4GFQ","Wilmington")
recommendation("IpLRJY4CP3fXtlEd8Y4GFQ","New Castle")
recommendation("GG0mFsEXb-02_dzFPqRV1Q","Wilmington")




