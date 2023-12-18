mongoimport --collection "yelp_restaurants" "nouveau_yelp_restaurants.json" --drop --jsonArray



1]
db.yelp_restaurants.find({ "city": "Greenville" })

2]
db.yelp_review.find({ "stars": { $lte: 2.0 } }, { "user_id": 1 })

3]
db.yelp_restaurants.find({ "city": "New Castle", "criteres": "Mexican" }, { "name": 1, "address": 1 })

4]
db.yelp_user.find({ "nbFriends": 0 }).count()

5]
db.yelp_restaurants.aggregate([ { $group: { _id: "$city", count: { $sum: 1 } } } ])

6]
db.yelp_restaurants.find({}).sort({ "avg_stars": -1 }).limit(1)

7]
db.yelp_restaurants.find({"nbAmbience":{$gte:3}})

8]
db.yelp_review.find({ "user_id": { $in: ["n2UpKhkU2N-66a1QQzrjYw", "ucD25otZ0uqWPSJnl4muQQ"] } }, { "business_id": 1, "_id": 0 })

9]
db.yelp_review.aggregate([ { $match: { "business_id": { $in: ["UBX73ZWgCdgom4nv0UeGvg", "51Fo_uY52A5oaI8YTHU5yg"] } } }, { $group: { _id: "$user_id", count: { $sum: 1 } } }, { $match: { count: { $gte: 2 } } }, { $lookup: { from: "yelp_user", localField: "user_id", foreignField: "user_id", as: "user_info" } }, { $project: { "_id": 0, "user_id": "$_id", "user_name": { $arrayElemAt: ["$user_info.name", 0] } } }] )


10]
db.yelp_restaurants.find({ $or: [ { "avg_stars": { $gt: 4.0 } }, { "avg_stars": { $lt: 2.0 } } ] }).count()

11]
db.yelp_review.aggregate([ { $match: { "user_id": "FlXBpK_YZxLo27jcMdII1w" } }, { $lookup: { from: "yelp_restaurants", localField: "business_id", foreignField: "business_id", as: "restaurant" } }, { $unwind: "$restaurant" }, { $project: { "restaurant.categories": 1, "_id": 0 } } ])


12]
db.yelp_user.aggregate([{ $project: { "user_id": 1, "nbFriends":1 } }])

13]
db.yelp_user.aggregate([
    { $match: { user_id: { $in: ["FlXBpK_YZxLo27jcMdII1w", "6Mv-qMJyxSokCu8YFM1o0A"] } } },
    { $group: { _id: null, friends: { $push: "$friends" } } },
    { $unwind: "$friends" },
    { $group: { _id: "$friends", count: { $sum: 1 } } },
    { $match: { count: { $gte: 2 } } },
    { $project: { _id: 0, friend_id: "$_id" } }
]);



14]
db.yelp_review.find({ "text": { $regex: "amazing", $options: "i" } }, { "text": 1, "_id": 0 })

15]
db.yelp_user.aggregate([ { $group: { _id: "$name", count: { $sum: 1 } } }, { $sort: { count: -1 } }, { $limit: 3 } ])


