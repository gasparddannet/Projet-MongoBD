sudo systemctl stop mongod
sudo systemctl status mongod


mongoimport --collection "yelp_restaurants" "nouveau_yelp_restaurants.json" --drop --jsonArray
mongoimport --collection "yelp_user" "nouveau_yelp_user.json" --drop --jsonArray
mongoimport --collection "yelp_review" "nouveau_yelp_review.json" --drop --jsonArray


1]
db.yelp_restaurants.find({ "city": "Greenville" })

test> db.yelp_restaurants.find({ "city": "Greenville" })
[
  {
    _id: ObjectId('65803ef37cf2cb46f0887c66'),
    business_id: 'Vo4NZBtF3mr6EJitNnq-Wg',
    name: 'Pizzeria Maki',
    city: 'Greenville',
    address: '4007 Kennett Pike, Ste A',
    categories: 'Restaurants, Pizza, Salad, Sushi Bars',
    nbAmbience: 0,
    criteres: [ 'Restaurants', 'Pizza', 'Salad', 'Sushi Bars' ],
    nb_review: 13,
    avg_stars: 4.769230769230769
  },
  {
    _id: ObjectId('65803ef37cf2cb46f0887ccf'),
    business_id: 'sTvFxzQU_4bm-owSJXx0MQ',
    name: "Cromwell's American Tavern and Taqueria",
    city: 'Greenville',
    address: '3858 Kennett Pike',
    categories: 'Nightlife, Bars, Mexican, American (New), Restaurants',
    nbAmbience: 1,
    criteres: [
      'Nightlife',
      'Bars',
      'Mexican',
      'American (New)',
      'Restaurants',
      'casual'
    ],
    nb_review: 101,
    avg_stars: 3.237623762376238
  },
  {
    _id: ObjectId('65803ef37cf2cb46f0887ce0'),
    business_id: '_ju1BXAF5g5QtAFfZZKO1g',
    name: 'Brew Ha Ha',
    city: 'Greenville',
    address: '3838 Kennett Pike',
    categories: 'Food, Breakfast & Brunch, American (New), Restaurants, Coffee & Tea',
    nbAmbience: 1,
    criteres: [
      'Food',
      'Breakfast & Brunch',
      'American (New)',
      'Restaurants',
      'Coffee & Tea',
      'hipster'
    ],
    nb_review: 83,
    avg_stars: 4.096385542168675
  },
  {
    _id: ObjectId('65803ef37cf2cb46f0887d22'),
    business_id: 'gRHfRxTqaf_oUapIB9MMUA',
    name: 'Cosi',
    city: 'Greenville',
    address: '3828 Kennett Pike Ste A',
    categories: 'Restaurants',
    nbAmbience: 0,
    criteres: [ 'Restaurants' ],
    nb_review: 8,
    avg_stars: 3
  },
  {
    _id: ObjectId('65803ef37cf2cb46f0887dd4'),
    business_id: 'hJ0QkeOdQ5y7MTmdR9NO1Q',
    name: 'The Copper Dram',
    city: 'Greenville',
    address: '3826 Kennett Pike',
    categories: 'Beer, Wine & Spirits, Cocktail Bars, American (New), Bars, Food, Nightlife, American (Traditional), Restaurants',
    nbAmbience: 3,
    criteres: [
      'Beer',
      'Wine & Spirits',
      'Cocktail Bars',
      'American (New)',
      'Bars',
      'Food',
      'Nightlife',
      'American (Traditional)',
      'Restaurants',
      'casual',
      'romantic',
      'upscale'
    ],
    nb_review: 59,
    avg_stars: 4.52542372881356
  },
  {
    _id: ObjectId('65803ef37cf2cb46f0887e64'),
    business_id: 'K3ZZua4ab6YLhPqZ_DEDlw',
    name: 'BBC Tavern and Grill',
    city: 'Greenville',
    address: '4019 Kennett Pike',
    categories: 'Nightlife, Restaurants, American (Traditional), Bars, Beer, Wine & Spirits, Food, Sports Bars',
    nbAmbience: 1,
    criteres: [
      'Nightlife',
      'Restaurants',
      'American (Traditional)',
      'Bars',
      'Beer',
      'Wine & Spirits',
      'Food',
      'Sports Bars',
      'casual'
    ],
    nb_review: 112,
    avg_stars: 3
  },
  {
    _id: ObjectId('65803ef37cf2cb46f0887eb3'),
    business_id: 'GsTHcKsO4c9ZnK0AdwfCpw',
    name: 'Starbucks',
    city: 'Greenville',
    address: '3828 Kennett Pike, Ste A',
    categories: 'Cafes, Coffee & Tea, Restaurants, Food, American (New)',
    nbAmbience: 0,
    criteres: [
      'Cafes',
      'Coffee & Tea',
      'Restaurants',
      'Food',
      'American (New)'
    ],
    nb_review: 9,
    avg_stars: 3.4444444444444446
  }
]



2]
db.yelp_review.find({ "stars": { $lte: 2.0 } }, { "user_id": 1 })


test> db.yelp_review.find({ "stars": { $lte: 2.0 } }, { "user_id": 1 })
[
  {
    _id: ObjectId('65803f0d24fc4ae889e31002'),
    user_id: 'TRFTDMJegE6DituEKBpEKQ'
  },
  {
    _id: ObjectId('65803f0d24fc4ae889e3100c'),
    user_id: '9kMl5dY91gmSWOqYM7SXkQ'
  },
  {
    _id: ObjectId('65803f0d24fc4ae889e3100d'),
    user_id: 'hnBjegpdsr9rqMBD4qf3Yw'
  },
  {
    _id: ObjectId('65803f0d24fc4ae889e31010'),
    user_id: 'C3g8rpjTzTdxmujnHaR1Tw'
  },
  {
    _id: ObjectId('65803f0d24fc4ae889e31015'),
    user_id: 'xJsQdMwcKZDdaF9ZfcY75w'
  },
  {
    _id: ObjectId('65803f0d24fc4ae889e3101d'),
    user_id: 'xOFcwFrmjwnXYjLqxk_rjQ'
  },
  {
    _id: ObjectId('65803f0d24fc4ae889e3101f'),
    user_id: 'Kj0Q_b0DHCghpK65CP3JVw'
  },
  {
    _id: ObjectId('65803f0d24fc4ae889e31020'),
    user_id: 'Aa1cdgFJYWe37RE4dnrh0w'
  },
  {
    _id: ObjectId('65803f0d24fc4ae889e31023'),
    user_id: 'lKXC8QOjVginznZymty7OA'
  },
  {
    _id: ObjectId('65803f0d24fc4ae889e31027'),
    user_id: '6VYj2DVWmASWfFJ0WxAiyQ'
  },
  {
    _id: ObjectId('65803f0d24fc4ae889e3102b'),
    user_id: '2aYMMSAxuhkKWaBWH8Oykg'
  },
  {
    _id: ObjectId('65803f0d24fc4ae889e3102c'),
    user_id: '5py7HurGiQkg5hKwelk3HA'
  },
  {
    _id: ObjectId('65803f0d24fc4ae889e31035'),
    user_id: '0Ler18OI57Ef6C4OzwACAg'
  },
  {
    _id: ObjectId('65803f0d24fc4ae889e3103a'),
    user_id: '6Rd-Oz0Iqns4_9NIhG9blw'
  },
  {
    _id: ObjectId('65803f0d24fc4ae889e3103b'),
    user_id: 'XjLvFaNKzzprEDRR-3kxsQ'
  },
  {
    _id: ObjectId('65803f0d24fc4ae889e3103c'),
    user_id: 'kBFb2l1OmfQ-zLOR1d112Q'
  },
  {
    _id: ObjectId('65803f0d24fc4ae889e31040'),
    user_id: 'HfjOWCJyRsUCSGBKkmudgw'
  },
  {
    _id: ObjectId('65803f0d24fc4ae889e31042'),
    user_id: 'ES-WvATjZylnoamV2b00Aw'
  },
  {
    _id: ObjectId('65803f0d24fc4ae889e31047'),
    user_id: 'wig0uC_qyPXfm3SmsjFCVQ'
  },
  {
    _id: ObjectId('65803f0d24fc4ae889e31051'),
    user_id: 'bCmOH5WRgd8MMLsz_jlfQA'
  }

.
.
.
.
]





3]
db.yelp_restaurants.find({ "city": "New Castle", "criteres": "Mexican" }, { "name": 1, "address": 1 })

test> db.yelp_restaurants.find({ "city": "New Castle", "criteres": "Mexican" }, { "name": 1, "address": 1 })
[
  {
    _id: ObjectId('65803ef37cf2cb46f0887cac'),
    name: 'Three Countries Pizzeria',
    address: '202 E 6th St'
  },
  {
    _id: ObjectId('65803ef37cf2cb46f0887d2a'),
    name: 'Rivera Taco Express',
    address: '243 Christiana Rd'
  },
  {
    _id: ObjectId('65803ef37cf2cb46f0887d33'),
    name: 'Taqueria Atexquita',
    address: '220 New Castle Ave'
  },
  {
    _id: ObjectId('65803ef37cf2cb46f0887d63'),
    name: 'Chipotle Mexican Grill',
    address: '115A S Dupont Hwy'
  },
  {
    _id: ObjectId('65803ef37cf2cb46f0887d7d'),
    name: 'El Cantaro',
    address: '181 S Dupont Hwy'
  },
  {
    _id: ObjectId('65803ef37cf2cb46f0887d8a'),
    name: 'Los Taquitos De Puebla',
    address: '241 N Dupont Hwy'
  },
  {
    _id: ObjectId('65803ef37cf2cb46f0887d95'),
    name: 'Casa Mariachi',
    address: '519 E Basin Rd'
  },
  {
    _id: ObjectId('65803ef37cf2cb46f0887de0'),
    name: 'La Tlaxquenita',
    address: '218 New Castle Ave'
  },
  {
    _id: ObjectId('65803ef37cf2cb46f0887e7b'),
    name: 'Taco Bell',
    address: '116 North Dupont Highway'
  },
  {
    _id: ObjectId('65803ef37cf2cb46f0887f0d'),
    name: 'Los Jarritos',
    address: '110 N Dupont Hwy'
  },
  {
    _id: ObjectId('65803ef37cf2cb46f0887f64'),
    name: 'Mi Cosina',
    address: '165 S Dupont Hwy'
  },
  {
    _id: ObjectId('65803ef37cf2cb46f0887f77'),
    name: 'Mr. Taco',
    address: '101 East Hazeldell Ave'
  }
]



4]
db.yelp_user.find({ "nbFriends": 0 }).count()

test> db.yelp_user.find({ "nbFriends": 0 }).count()
16047



5]
db.yelp_restaurants.aggregate([ { $group: { _id: "$city", count: { $sum: 1 } } } ])


test> db.yelp_restaurants.aggregate([ { $group: { _id: "$city", count: { $sum: 1 } } } ])
[
  { _id: 'Trolley Square', count: 1 },
  { _id: 'Talleyville', count: 3 },
  { _id: 'Claymont', count: 23 },
  { _id: 'Pike Creek', count: 2 },
  { _id: 'Stanton', count: 1 },
  { _id: 'wilmington', count: 1 },
  { _id: 'Newport', count: 3 },
  { _id: 'Wilmington ', count: 1 },
  { _id: 'Montchanin', count: 2 },
  { _id: 'Aston', count: 1 },
  { _id: 'Christiana', count: 6 },
  { _id: 'Greenville', count: 7 },
  { _id: 'Elsmere', count: 2 },
  { _id: 'Newark', count: 146 },
  { _id: 'New Castle', count: 102 },
  { _id: 'Marshallton', count: 1 },
  { _id: 'Hockessin', count: 37 },
  { _id: 'Wilmington Manor', count: 2 },
  { _id: 'Glen Mills', count: 1 },
  { _id: 'Wilmington', count: 619 }
]



6]
db.yelp_restaurants.find({}).sort({ "avg_stars": -1 }).limit(1)


test> db.yelp_restaurants.find({}).sort({ "avg_stars": -1 }).limit(1)
[
  {
    _id: ObjectId('65803ef37cf2cb46f0887c90'),
    business_id: 'wWcETNWBnFEi1J_W_9hXJA',
    name: 'El Fogon De Tato',
    city: 'Wilmington',
    address: '2304 Kirkwood Hwy',
    categories: 'Puerto Rican, Restaurants, Latin American, Caribbean',
    nbAmbience: 0,
    criteres: [ 'Puerto Rican', 'Restaurants', 'Latin American', 'Caribbean' ],
    nb_review: 7,
    avg_stars: 5
  }
]


7]
db.yelp_restaurants.find({"nbAmbience":{$gte:3}})

test> db.yelp_restaurants.find({"nbAmbience":{$gte:3}})
[
  {
    _id: ObjectId('65803ef37cf2cb46f0887c5b'),
    business_id: 'A_-Vv5oKZNqxsV69_7E2KQ',
    name: '8th & Union Kitchen',
    city: 'Wilmington',
    address: '801 N Union St',
    categories: 'Vietnamese, Asian Fusion, Bars, American (New), Restaurants, Breakfast & Brunch, Nightlife, Thai, Gluten-Free',
    nbAmbience: 3,
    criteres: [
      'Vietnamese',
      'Asian Fusion',
      'Bars',
      'American (New)',
      'Restaurants',
      'Breakfast & Brunch',
      'Nightlife',
      'Thai',
      'Gluten-Free',
      'trendy',
      'classy',
      'casual'
    ],
    nb_review: 181,
    avg_stars: 3.5138121546961325
  },
  {
    _id: ObjectId('65803ef37cf2cb46f0887cdb'),
    business_id: 'Nvy1jETQItFjG0oyjpGk7w',
    name: 'Farmer & the Cow',
    city: 'Wilmington',
    address: '413 N Market St',
    categories: 'Burgers, Beer, Wine & Spirits, Nightlife, Restaurants, Cocktail Bars, Food, Bars, Juice Bars & Smoothies, Salad',
    nbAmbience: 3,
    criteres: [
      'Burgers',
      'Beer',
      'Wine & Spirits',
      'Nightlife',
      'Restaurants',
      'Cocktail Bars',
      'Food',
      'Bars',
      'Juice Bars & Smoothies',
      'Salad',
      'hipster',
      'trendy',
      'casual'
    ],
    nb_review: 254,
    avg_stars: 4.02755905511811
  },
  {
    _id: ObjectId('65803ef37cf2cb46f0887d37'),
    business_id: 'Co47eJ287hxR-9iqhnswcw',
    name: 'Twisted Soul Restaurant & Bar',
    city: 'Wilmington',
    address: '413 N Market St',
    categories: 'Asian Fusion, Restaurants, Soul Food, American (Traditional), Cajun/Creole',
    nbAmbience: 3,
    criteres: [
      'Asian Fusion',
      'Restaurants',
      'Soul Food',
      'American (Traditional)',
      'Cajun/Creole',
      'intimate',
      'trendy',
      'casual'
    ],
    nb_review: 46,
    avg_stars: 3.5434782608695654
  },
  {
    _id: ObjectId('65803ef37cf2cb46f0887d6b'),
    business_id: 'r19qAeTxkc-aes2UVt9v5Q',
    name: 'Pizza by Elizabeths',
    city: 'Wilmington',
    address: '4019 Kennett Pike',
    categories: 'Restaurants, Pizza',
    nbAmbience: 3,
    criteres: [ 'Restaurants', 'Pizza', 'classy', 'trendy', 'upscale' ],
    nb_review: 65,
    avg_stars: 3.476923076923077
  },
  {
    _id: ObjectId('65803ef37cf2cb46f0887d7c'),
    business_id: 'lwJllJ5e4CLHdliOPEfgGg',
    name: 'Rice Restaurant',
    city: 'Wilmington',
    address: '2015 Limestone Rd',
    categories: 'Asian Fusion, Chinese, Restaurants, Japanese',
    nbAmbience: 3,
    criteres: [
      'Asian Fusion',
      'Chinese',
      'Restaurants',
      'Japanese',
      'trendy',
      'classy',
      'casual'
    ],
    nb_review: 144,
    avg_stars: 3.8194444444444446
  },
  {
    _id: ObjectId('65803ef37cf2cb46f0887dbf'),
    business_id: '-PTWFicakClBDK-zyQ5hjA',
    name: 'First Watch',
    city: 'Newark',
    address: '74 Geoffrey Dr',
    categories: 'Cafes, Breakfast & Brunch, American (Traditional), American (New), Restaurants',
    nbAmbience: 3,
    criteres: [
      'Cafes',
      'Breakfast & Brunch',
      'American (Traditional)',
      'American (New)',
      'Restaurants',
      'hipster',
      'casual',
      'trendy'
    ],
    nb_review: 173,
    avg_stars: 3.930635838150289
  },
  {
    _id: ObjectId('65803ef37cf2cb46f0887dd4'),
    business_id: 'hJ0QkeOdQ5y7MTmdR9NO1Q',
    name: 'The Copper Dram',
    city: 'Greenville',
    address: '3826 Kennett Pike',
    categories: 'Beer, Wine & Spirits, Cocktail Bars, American (New), Bars, Food, Nightlife, American (Traditional), Restaurants',
    nbAmbience: 3,
    criteres: [
      'Beer',
      'Wine & Spirits',
      'Cocktail Bars',
      'American (New)',
      'Bars',
      'Food',
      'Nightlife',
      'American (Traditional)',
      'Restaurants',
      'casual',
      'romantic',
      'upscale'
    ],
    nb_review: 59,
    avg_stars: 4.52542372881356
  },
  {
    _id: ObjectId('65803ef37cf2cb46f0887e5f'),
    business_id: '51Fo_uY52A5oaI8YTHU5yg',
    name: 'Trolley Square Oyster House',
    city: 'Wilmington',
    address: '1707 Delaware Ave',
    categories: 'Nightlife, Sports Bars, Seafood, Breakfast & Brunch, Bars, Sandwiches, Restaurants',
    nbAmbience: 4,
    criteres: [
      'Nightlife',
      'Sports Bars',
      'Seafood',
      'Breakfast & Brunch',
      'Bars',
      'Sandwiches',
      'Restaurants',
      'hipster',
      'trendy',
      'classy',
      'casual'
    ],
    nb_review: 177,
    avg_stars: 4.1807909604519775
  },
  {
    _id: ObjectId('65803ef37cf2cb46f0887e83'),
    business_id: 'BJxoz5d_Z45JasgZ7o-5_g',
    name: 'Satsuma Asian Kitchen & Bar',
    city: 'Wilmington',
    address: '1707 Delaware Ave',
    categories: 'Salad, Nightlife, Restaurants, Asian Fusion, Bars, Cocktail Bars',
    nbAmbience: 3,
    criteres: [
      'Salad',
      'Nightlife',
      'Restaurants',
      'Asian Fusion',
      'Bars',
      'Cocktail Bars',
      'hipster',
      'trendy',
      'casual'
    ],
    nb_review: 54,
    avg_stars: 2.925925925925926
  },
  {
    _id: ObjectId('65803ef37cf2cb46f0887eaa'),
    business_id: 'evrQGHs_lC_fmEniotaX8A',
    name: 'Turning Point of Christiana',
    city: 'Newark',
    address: '204 Fashion Center Blvd',
    categories: 'American (Traditional), Food, Coffee & Tea, Breakfast & Brunch, Restaurants',
    nbAmbience: 3,
    criteres: [
      'American (Traditional)',
      'Food',
      'Coffee & Tea',
      'Breakfast & Brunch',
      'Restaurants',
      'casual',
      'trendy',
      'classy'
    ],
    nb_review: 145,
    avg_stars: 3.8275862068965516
  },
  {
    _id: ObjectId('65803ef37cf2cb46f0887ee0'),
    business_id: 'Wbqv9rUtbNanq-hhegOYsg',
    name: 'Pizza by Elizabeths',
    city: 'Wilmington',
    address: '3801 Kennett Pike, Ste E220',
    categories: 'Pizza, Restaurants',
    nbAmbience: 3,
    criteres: [ 'Pizza', 'Restaurants', 'romantic', 'trendy', 'classy' ],
    nb_review: 188,
    avg_stars: 3.797872340425532
  },
  {
    _id: ObjectId('65803ef37cf2cb46f0887f45'),
    business_id: 'jRbCgGm1cpIcBZf-vOhJvA',
    name: 'Daily Veg - Pike Creek',
    city: 'Wilmington',
    address: '5335B Limestone Rd',
    categories: 'Food, Restaurants, Acai Bowls, Vegan, Juice Bars & Smoothies, Gluten-Free',
    nbAmbience: 3,
    criteres: [
      'Food',
      'Restaurants',
      'Acai Bowls',
      'Vegan',
      'Juice Bars & Smoothies',
      'Gluten-Free',
      'hipster',
      'trendy',
      'casual'
    ],
    nb_review: 57,
    avg_stars: 4.192982456140351
  },
  {
    _id: ObjectId('65803ef37cf2cb46f0887f4e'),
    business_id: 'MqJlz0N3ujhtZCWnJmOpZg',
    name: 'Cafe New Castle',
    city: 'New Castle',
    address: '414 Delaware St',
    categories: 'Event Planning & Services, American (Traditional), Burgers, Caterers, Salad, Restaurants, Breakfast & Brunch',
    nbAmbience: 4,
    criteres: [
      'Event Planning & Services',
      'American (Traditional)',
      'Burgers',
      'Caterers',
      'Salad',
      'Restaurants',
      'Breakfast & Brunch',
      'romantic',
      'intimate',
      'classy',
      'casual'
    ],
    nb_review: 71,
    avg_stars: 4.112676056338028
  },
  {
    _id: ObjectId('65803ef37cf2cb46f0887f9e'),
    business_id: 'yvVJxONMGqOzO1ouw77J3Q',
    name: 'Constitution Yards',
    city: 'Wilmington',
    address: '308 Justison St',
    categories: 'Barbeque, Nightlife, Restaurants, Beer Gardens',
    nbAmbience: 3,
    criteres: [
      'Barbeque',
      'Nightlife',
      'Restaurants',
      'Beer Gardens',
      'hipster',
      'casual',
      'trendy'
    ],
    nb_review: 56,
    avg_stars: 4.071428571428571
  }
]


7bis]
test> db.yelp_restaurants.find({ "nbAmbience": { $gte: 3 } }, { _id:0, name: 1 } )
[
  { name: '8th & Union Kitchen' },
  { name: 'Farmer & the Cow' },
  { name: 'Twisted Soul Restaurant & Bar' },
  { name: 'Pizza by Elizabeths' },
  { name: 'Rice Restaurant' },
  { name: 'First Watch' },
  { name: 'The Copper Dram' },
  { name: 'Trolley Square Oyster House' },
  { name: 'Satsuma Asian Kitchen & Bar' },
  { name: 'Turning Point of Christiana' },
  { name: 'Pizza by Elizabeths' },
  { name: 'Daily Veg - Pike Creek' },
  { name: 'Cafe New Castle' },
  { name: 'Constitution Yards' }
]



8]
db.yelp_review.find({ "user_id": { $in: ["n2UpKhkU2N-66a1QQzrjYw", "ucD25otZ0uqWPSJnl4muQQ"] } }, { "business_id": 1, "_id": 0 })


test> db.yelp_review.find({ "user_id": { $in: ["n2UpKhkU2N-66a1QQzrjYw", "ucD25otZ0uqWPSJnl4muQQ"] } }, { "business_id": 1, "_id": 0 })
[
  { business_id: 'Dy91wdWkwtI_qgjAIZ0Niw' },
  { business_id: 'Dy91wdWkwtI_qgjAIZ0Niw' },
  { business_id: '7O7YHTUB3uqXHsQSLKR0SA' },
  { business_id: 'citzbW-2MVEZRNBqpVO-Jw' },
  { business_id: 'c4D851qxOujE5KTH8upXTA' },
  { business_id: '3zWNxtRhyR4rLPfXyQgSyw' },
  { business_id: 'jVJH1KfitQi87MYMh6vyMg' },
  { business_id: 'EROSyhoWNCUH53NrDrsHgQ' },
  { business_id: '3zWNxtRhyR4rLPfXyQgSyw' },
  { business_id: 'Dy91wdWkwtI_qgjAIZ0Niw' },
  { business_id: 'OlOVRlcEstxKK_6hMjy63A' },
  { business_id: 'uoMWvXch6sWnI9FMsE_-Vg' },
  { business_id: 'N-_ilHVIMQqzkga7nHfA8A' },
  { business_id: 'EROSyhoWNCUH53NrDrsHgQ' },
  { business_id: '5RtAJPXFLTzwALIe1mtNuA' },
  { business_id: '_Oksx3ALgKLRVxeAR8l_qA' },
  { business_id: '52RFRa6UlbIxy8EnWJQpjg' },
  { business_id: '8vvMGaJ5biveUVE6-yTipQ' },
  { business_id: 'qFsh80AAL90tkOc0n98bqg' },
  { business_id: 'fd_fNaeZxcZfUza3K6Be9w' },

.
.
.
  { business_id: 'VbzoVWEPSfzaIGBq4KlVwQ' },
  { business_id: 'JvFDMS5yryf3lDwUPAb6OQ' },
  { business_id: 'riwJWxj4850tGBhRahDt7g' },
  { business_id: 'aAslC0l5mZB8oJNbld0byA' },
  { business_id: 'v6AlogsSBf4sxrVHcSnMHQ' },
  { business_id: 'UREmwQBCMimpOuFyKPW3xw' },
  { business_id: 'Z53I9xwy0aMRy577GuM1KQ' },
  { business_id: 'v6AlogsSBf4sxrVHcSnMHQ' },
  { business_id: 'ELgR35KIlpuTMeWi6tFP7g' }
]


9]
db.yelp_review.aggregate([ { $match: { "business_id": { $in: ["UBX73ZWgCdgom4nv0UeGvg", "51Fo_uY52A5oaI8YTHU5yg"] } } }, { $group: { _id: "$user_id", count: { $sum: 1 } } }, { $match: { count: { $gte: 2 } } }, { $lookup: { from: "yelp_user", localField: "user_id", foreignField: "user_id", as: "user_info" } }, { $project: { "_id": 0, "user_id": "$_id", "user_name": { $arrayElemAt: ["$user_info.name", 0] } } }] )

test> db.yelp_review.aggregate([ { $match: { "business_id": { $in: ["UBX73ZWgCdgom4nv0UeGvg", "51Fo_uY52A5oaI8YTHU5yg"] } } }, { $group: { _id: "$user_id", count: { $sum: 1 } } }, { $match: { count: { $gte: 2 } } }, { $lookup: { from: "yelp_user", localField: "user_id", foreignField: "user_id", as: "user_info" } }, { $project: { "_id": 0, "user_id": "$_id", "user_name": { $arrayElemAt: ["$user_info.name", 0] } } }] )
[
  { user_id: 'B9iPTih0dmpZn6fRyZnLLg' },
  { user_id: '0ojv9GMM4ljRiULkjyXYmQ' },
  { user_id: 'I7Fmd8WQA0FozWOEZQNdkw' },
  { user_id: 'gF9BKX9fuTPQL-EFvSok2Q' },
  { user_id: 'G1cT_L6toouKCIehhgCzWQ' },
  { user_id: '_grk4WsJa4evlds1pFbfzg' },
  { user_id: 'B6uZlAMkd9EbPiX3k4fxsA' },
  { user_id: 'v4KYRLFGmeqwlntnDbJ4Uw' },
  { user_id: 'LR5KLo9TkFbuLTUnQXz0xA' },
  { user_id: 'p-swY1Yb2qTOpnwjy65W3A' },
  { user_id: 'Q3MDOyTjrDmE72ZX3ZQPKA' },
  { user_id: 'qKOWuKXqa_16hmLnbntS1A' },
  { user_id: 'dXSUR6L9B10g-YMQMlnkag' },
  { user_id: 'DDBM1aIU5t9JfwjwQRk1Sg' },
  { user_id: 's9wPpM3DIceER-AZllqmmQ' },
  { user_id: 's8CI5iAMRD6b5yLn0EG2Tw' },
  { user_id: 'ehR-kzNZUBUm_RJmnTZ94Q' },
  { user_id: 'S6K4l-tzNekMg3YOKVHJ_A' },
  { user_id: 'uvEIDVQx3gctkUTBarAEng' },
  { user_id: 'YwEuCgKpQZ9MLvqBDJBAog' },
  .
  .
  .
  { user_id: 'ksg167hKZcWBiPP1F8DtRw' },
  { user_id: 'KPCsL2cHkTnRbSPvYyaCTQ' },
  { user_id: 'RIEQ8qmFmHoRd_iQq7CUqg' },
  { user_id: 'kyVJXFsIf_JaHMy51rc67w' }
]



10]
db.yelp_restaurants.find({ $or: [ { "avg_stars": { $gt: 4.0 } }, { "avg_stars": { $lt: 2.0 } } ] }).count()


test> db.yelp_restaurants.find({ $or: [ { "avg_stars": { $gt: 4.0 } }, { "avg_stars": { $lt: 2.0 } } ] }).count()
316


11]
db.yelp_review.aggregate([ { $match: { "user_id": "FlXBpK_YZxLo27jcMdII1w" } }, { $lookup: { from: "yelp_restaurants", localField: "business_id", foreignField: "business_id", as: "restaurant" } }, { $unwind: "$restaurant" }, { $project: { "restaurant.categories": 1, "_id": 0 } } ])


test> db.yelp_review.aggregate([ { $match: { "user_id": "FlXBpK_YZxLo27jcMdII1w" } }, { $lookup: { from: "yelp_restaurants", localField: "business_id", foreignField: "business_id", as: "restaurant" } }, { $unwind: "$restaurant" }, { $project: { "restaurant.categories": 1, "_id": 0 } } ])
[
  {
    restaurant: {
      categories: 'Cajun/Creole, Vegetarian, Restaurants, Tex-Mex, Cocktail Bars, Bars, Nightlife'
    }
  },
  {
    restaurant: {
      categories: 'Nightlife, Sports Bars, Seafood, Breakfast & Brunch, Bars, Sandwiches, Restaurants'
    }
  }
]


12]
db.yelp_user.aggregate([{ $project: { "user_id": 1, "nbFriends":1 } }])


test> db.yelp_user.find({},{ "user_id": 1, "nbFriends":1 })
[
  {
    _id: ObjectId('65803efff1c98639ea9fac04'),
    user_id: 'XLs_PhrJ7Qwn_RfgMM7Djw',
    nbFriends: 0
  },
  {
    _id: ObjectId('65803efff1c98639ea9fac05'),
    user_id: '0juMoWXC7z4c7LgQP2s3sA',
    nbFriends: 4
  },
  {
    _id: ObjectId('65803efff1c98639ea9fac06'),
    user_id: '1-gnHNzZNbn8lFwYRF_CtA',
    nbFriends: 3
  },
  {
    _id: ObjectId('65803efff1c98639ea9fac07'),
    user_id: 'PadmV2GEoA6mWpQUpPh7Ig',
    nbFriends: 2
  },
  {
    _id: ObjectId('65803efff1c98639ea9fac08'),
    user_id: 'FlhZYUEhfpfm0Ynxacftwg',
    nbFriends: 5
  },
  {
    _id: ObjectId('65803efff1c98639ea9fac09'),
    user_id: 'FH14lvoIAKhva9KVgvzKJw',
    nbFriends: 0
  },
.
.
.
]

12bis]
test> db.yelp_user.find({},{ _id:0, user_id: 1, nbFriends:1 })
[
  { user_id: 'XLs_PhrJ7Qwn_RfgMM7Djw', nbFriends: 0 },
  { user_id: '0juMoWXC7z4c7LgQP2s3sA', nbFriends: 4 },
  { user_id: '1-gnHNzZNbn8lFwYRF_CtA', nbFriends: 3 },
  { user_id: 'PadmV2GEoA6mWpQUpPh7Ig', nbFriends: 2 },
  { user_id: 'FlhZYUEhfpfm0Ynxacftwg', nbFriends: 5 },
  { user_id: 'FH14lvoIAKhva9KVgvzKJw', nbFriends: 0 },
  { user_id: '7LmJ87EijrHcoYRu9WgoHg', nbFriends: 14 },
  { user_id: 'VFXKRVzEMbnsDcYFdwiiuA', nbFriends: 2 },
  { user_id: 'IpLRJY4CP3fXtlEd8Y4GFQ', nbFriends: 23 },
  { user_id: 'UJEjJgi1xpmLR4b3J8fn2Q', nbFriends: 75 },
  { user_id: 'kLm3B6LeboEZWX_4otpILA', nbFriends: 2 },
  { user_id: 'mZHk_DPbeUTQBZOBOyoqlA', nbFriends: 6 },
  { user_id: 'nPJw7YpKgHE6fowxgl3l1A', nbFriends: 8 },
  { user_id: '-tnodf38uCXjogMhZtcWxw', nbFriends: 0 },
  { user_id: 'k_muz40jJaiY1PVga6NDXA', nbFriends: 17 },
  { user_id: 'GG0mFsEXb-02_dzFPqRV1Q', nbFriends: 39 },
  { user_id: 'y5qEpAfJQaOjjG8ZJWrp6w', nbFriends: 29 },
  { user_id: 'SBpz4xJ8MnrzXOpWiETCyw', nbFriends: 3 },
  { user_id: 'cwChkLd3jcvmqrk5UfUGJw', nbFriends: 3 },
  { user_id: 'NNyr4wknApjc5nF9QOO2Mg', nbFriends: 2 }
.
.
.
]


13]
db.yelp_user.aggregate([
    { $match: { user_id: { $in: ["FlXBpK_YZxLo27jcMdII1w", "6Mv-qMJyxSokCu8YFM1o0A"] } } },
    { $group: { _id: null, friends: { $push: "$friends" } } },
    { $unwind: "$friends" },
    { $group: { _id: "$friends", count: { $sum: 1 } } },
    { $match: { count: { $gte: 2 } } },
    { $project: { _id: 0, friend_id: "$_id" } }
]);

test> db.yelp_user.find({},{ "user_id": 1, "nbFriends":1 })
[
  {
    _id: ObjectId('65803efff1c98639ea9fac04'),
    user_id: 'XLs_PhrJ7Qwn_RfgMM7Djw',
    nbFriends: 0
  },
  {
    _id: ObjectId('65803efff1c98639ea9fac05'),
    user_id: '0juMoWXC7z4c7LgQP2s3sA',
    nbFriends: 4
  },
  {
    _id: ObjectId('65803efff1c98639ea9fac06'),
    user_id: '1-gnHNzZNbn8lFwYRF_CtA',
    nbFriends: 3
  },
  {
    _id: ObjectId('65803efff1c98639ea9fac07'),
    user_id: 'PadmV2GEoA6mWpQUpPh7Ig',
    nbFriends: 2
  },
  {
    _id: ObjectId('65803efff1c98639ea9fac08'),
    user_id: 'FlhZYUEhfpfm0Ynxacftwg',
    nbFriends: 5
  },
  {
    _id: ObjectId('65803efff1c98639ea9fac09'),
    user_id: 'FH14lvoIAKhva9KVgvzKJw',
    nbFriends: 0
  },
.
.
.
]

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


test> db.yelp_review.find({ "text": { $regex: "amazing", $options: "i" } }, { "text": 1, "_id": 0 })
[
  {
    text: "This is my favorite in Delaware.  The menu is simple and perfectly executed.  Rolls are reasonably priced, artfully made and are PACKED with fish!  I do believe they use flash-frozen sashimi grade fish, but the color, texture, taste and smell are perfect.  Easily the best spicy tuna I have ever had.  I think the secret is the kewpie mayo along w/ the right amount of sriracha and sichimi powder.  Frankly, I can't get enough of this place and have at times, eaten it every day for lunch for weeks.  I've gone as far as to pick it up for dinner AFTER having had it for lunch. Their introduction of short-grain brown sushi rice has been great!\n" +
      '\n' +
      "The Sushiman, YC Park is amazing to watch.  I've seen him skin a cucumber with a sword-like sushi knife in no time flat, in a single ribbon and then continue to shave it into a nori thin sheet for his tuna naruto roll roll.  The temaki are as big as a carnival iced cream cone.  You can barely finish one of them, there is so much fish in there.  The nigiri are beautiful.  Uniform pieces of fresh fish, perfectly perched on the best sushi rice I've ever had (just the right amount of vinegar and sugar).\n" +
      '\n' +
      'Skip the newly opened Kooma.  Save Mikimotos for a night out, but go to Tokyo for lunch!  The owners are lovely, so support them in this tough economy.  If you must eat sushi, eat it here!\n' +
      '\n' +
      'Why not 5 stars?  I have to save it for places that serve the local fresh fish, plucked out of the water that morning.  Let me know if you find a place that does!'
  },
  {
    text: "It's good diner food. period.\n" +
      '\n' +
      'Nothing fancy, just simple food made well. Breakfast is a must. Homemade Belgium waffle covered in TONS of fruit....amazing.\n' +
      '\n' +
      "Simple Said...it's good diner food at a good price with friendly waitresses. On a Saturday morning...what more could you ask for?!"
  },
  {
    text: 'For a small local place, the crab cakes are very delicious. The restaurant is set up like a pizza shop. You order at the counter to eat in or take out. They bring the food to you if you eat in. If you order to go, they call the number on your receipt when your order is ready. \n' +
      '\n' +
      'My fiance and I tried the place out the first week it opened. We each ordered a crab cake platter since they are known for their crab cakes. We also ordered a cup of soup each since it was cold out. The portions were small but the crab cake was very good. It was full of crab and not fillers. \n' +
      '\n' +
      'The soups were amazing! I had a crab chowder and it was full of crab, not too creamy and great seasoning. \n' +
      '\n' +
      'The second time we came, I ordered the crab cake sandwich. The brioche bun was a little too much for the 6 oz crab cake. I had to gut out the bun. That allowed me to enjoy the crab cake more. \n' +
      '\n' +
      'The next day my sister came to visit and wanted to try it. This time we ordered the crab balls. Definitely not as good as the crab cakes. It was full of fillers and not a great way to introduce my sister to it. \n' +
      '\n' +
      'My fiance and i will definitely be back to give the rest of the menu a try.'
  },
  {
    text: 'WOW just WOW!!\n' +
      'Phenomenal crab cake, ciabatta roll was soft (toasted as I asked for toasted, still soft) amazingly good. \n' +
      'Get the sauce that is their specialty- horse radish, mayonnaise, spices. \n' +
      '\n' +
      'Just get it!'
  },
  {
    text: "Amazing chicken - I ordered take-out, and it was packaged well, and my whole family enjoyed it!! So different from anything in the area - I can't even put into words how flavorful the chicken is.. just pure yumminess!!\n" +
      '\n' +
      'And unlike other reviewers here, I found the service to be very quick and friendly!! \n' +
      '\n' +
      'Will definitely go there again... soon!!'
  },
  {
    text: 'Had dinner at Cafe Verdi last night, with my husband and granddaughter. I ordered the chicken piccata and my husband ordered the chicken caprese. Both entrees were amazing. My granddaughter ordered a piece of pizza and ate the whole thing, which is rare for her. We also had the mussels as an appetizer. They were delicious as well. Very friendly atmosphere and our waiter was great. Will definitely go there again!'
  },
  {
    text: "Amazing fried chicken. Call ahead when possible, and take it with you. Sides are delicious, biscuits are good, and the desserts are great as well. I do a Walt's lunch for my homeroom every year to celebrate the end of the year and it is a huge fave for the students - they LOVE it. Great staff as well. You can't get better fried chicken then this in Delaware or PA, that's for sure."
  },
  {
    text: "My husband and I were moving equipment and parked near the barbecue spot.  I bought water ice since it was incredibly hot - yum mango. Then the young man brought us a sample of the barbecue and it was the best that I ever tasted.  I worked in the food business for years and have cooked forever.  The next day my husband returned and ate at Russell's again.  We have told others and can't say enough about the product and the gentleman who served us.  Amazing to have such fresh, tasty food in a barebones shop.  Sweet potatoes and greens are equally as yummy!  We live in PA but can't wait to return to Centerville Rd. in DE."
  },
  {
    text: "My girlfriend and me drive all the way from Philadelphia just to eat at Cafe Napoli when we're craving Italian. The portions are generous and the food tastes amazing. Well worth the trip!"
  },
  {
    text: "Tl;dr : Request Robert! Great food, great atmosphere, and Robert is very lively and friendly.. I want to be friends with him irl not just have him as a server! Go on Sundays for brunch when Sam and Bruce are playing, they're fantastic.\n" +
      '\n' +
      "Today was my second time here, and we came to see Bruce and Sam play- two amazing musicians who play at Homegrown in Newark and Hummingbird in Trolley and probably a dozen other places. The food was great last time and even better today because of our awesome server: Robert. He was so nice and fun and made us laugh every time he came by. The restaurant was swamped and servers were literally running around but because of his hospitality whenever he stopped by I never felt like I was waiting for anything. When I was asking questions about a dish before I ordered it he flat out assured me he would make sure it came to me exactly as I wanted it, which many restaurants don't always comply to. I felt like I was cared about as an individual, not just as another customer. The music was great and Robert was so fun we ended up staying longer and drinking more than we intended! A+, requesting Robert every single time I come back."
  },
  {
    text: "I like this spot. It's a divey hole in the wall fried chicken joint. They have some different combos to choose from and also offer a wide variety of treats (read SWEET POTATO PIE!). I didn't have it, but it looked amazing. You receive your food in a box with some optional hot sauce. Opt for the hot sauce. From there devour with your hands and lick them clean. I should note there are a few metal tables outside, so keep in mind seating is limited. As a southerner, skip the sweet tea, it tasted like the bottled Lipton's stuff. Blech!"
  },
  {
    text: 'This is just a quick review for the E Bar staff that run the cafe out front of Nordstroms. You guys are amazing, fun to be around, and fast! I come on my 15 minute breaks for coffee, bagels, cookies, and the interesting treats that change all the time! I feel very welcome to be in this little shop and I just wanted to say tha k you!'
  },
  {
    text: `Cafe Verdi is our go-to whenever my sister, Mom and I want to meet somewhere relatively inexpensive and always delicious for dinner. Located in Trolley Square, across from Catherine Rooney's bar and the Logan House, Cafe Verdi offers you the option to sit down and eat or just pop in for a slice of pizza or calzone. They moved a few suites down, which threw me off a bit last night. The ambience is different inside - less pizza in a strip mall and more, "Hey! I get it....this is supposed to look like an Italian grotto." The food is always amazing. I never stray from my chicken alla griglia - two huge breasts of chicken with steamed broccoli and spinach. Last night, we had the polenta and eggplant stack (cold eggplant with mozzarella and roasted peppers) appetizers. For three discerning Italian palates, we were very happy. I had a pizelle for dessert, which my Mom had in her purse from a trip to see her Italian first cousin this weekend. No, I am not joking.`
  },
  {
    text: 'Staff was so friendly.  Ordered the classic and grilled pork and it was amazing and fresh.  The bubble drinks was also very tasty and not watered down - soft bobas for the win . Will definitely come back.'
  },
  {
    text: "Food was amazing as told. Chicken sandwich was awesome staff was great. service was fast. And specially the man reason I tried there chicken it was halal . I'll be there regular customer."
  },
  {
    text: "I have several categories for Italian food. If I want fresh pasta and red sauce I go Ristorante Attilio, great veal and more upscale then La Casa Pasta and if  I want amazing chicken dishes then it's always Cafe Napoli. The chicken cardinale in wine sauce is top notch and you will never see bigger portions."
  },
  {
    text: "Chef hutch is just amazing. It's like having your personal chef. Best food, best personality. Wish him all the best :)\n" +
      '\n' +
      'Jacky has been the best bar tender and Monica and Amanda at the front desk. Both always has the biggest smile and warm hugs. \n' +
      '\n' +
      'I look forward to seeing them every week :)'
  },
  {
    text: 'Awesome diner. My fiancé and I were in town visiting friends. We were so surprised at all of the menu options this place has to offer. \n' +
      '\n' +
      'By far, the best part is that they serve gluten free items. Also, the service is amazing. We had Carrie. She was super sweet and very attentive. \n' +
      '\n' +
      'We definitely will go back to this diner the next time we are in the area.'
  },
  {
    text: 'Hands down the best mexican restaurant ever. The guacamole is amazing here. The chips and salsa are so good. The salsa has this spicy sting to it and its so good. Considering i am mexican I have been to every single mexican restaurant in Delaware and somehow I always end up coming back to el Jefe. I really recomend the fajitas or the pollo timpiquena. my husband frquently gets the molcajete its huge. Overall its good though because the next day I pack it for his lunch so saves me time. I frequently come back here and take out also. Also try the margaritas they are reat !'
  },
  {
    text: 'Just walking in the amazing smell excited my senses.  The bar super hip, and very welcoming staff.  When greeted the server brought house filtered sparkling and still to choose from.  Love this!  I was super excited to hear skate was in the Pho plus on the side Thai basil, cilantro, bean sprouts and peppers.  Add as desired.  The general Tso chicken was AWESOME!!  Braised Game Hen (so tender) with bok choy, pineapple and rice.   Every thing was Outstanding!!!'
  }
.
.
.
]


15]
db.yelp_user.aggregate([ { $group: { _id: "$name", count: { $sum: 1 } } }, { $sort: { count: -1 } }, { $limit: 3 } ])

test> db.yelp_user.aggregate([ { $group: { _id: "$name", count: { $sum: 1 } } }, { $sort: { count: -1 } }, { $limit: 3 } ])
[
  { _id: 'John', count: 314 },
  { _id: 'Michael', count: 236 },
  { _id: 'David', count: 218 }
]


