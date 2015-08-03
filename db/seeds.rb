Venue.delete_all

Venue.create	name: "Chicago Q",
							address1: "1160 N Dearborn St",
							address2: "",
							zipcode: "60610",
							state: "IL",
							city: "Chicago",
							neighborhood: "Near North Side",
							cuisine: "Barbeque",
							desc: "The restaurant serves Whippen’s award-winning competition fare alongside regional favorites from the Carolinas, Texas, Missouri and Tennessee, which pair perfectly with the best selection of rare and exclusive bourbons in Chicago.",
							photo_url: "http://www.loyolaphoenix.com/wp-content/uploads/2013/10/DOLoutside2.jpg",
							url: "chicagoqrestaurant.com",
							reservations: "yes",
							created_at: Date.today() - 3

Venue.create	name: "Las Fuentes Restaurant",
							address1: "2558 N Halsted St",
							address2: "",
							zipcode: "60614",
							state: "IL",
							city: "Chicago",
							neighborhood: "Lincoln Park",
							cuisine: "Mexian",
							desc: "Our Lincoln park location has beautiful indoor dining rooms and a spacious patio that will make you feel as if you’re in a beautiful part of Mexico eating al fresco, enjoying a margarita, some guacamole, and the company of your friends.",
							photo_url: "http://lasfuentesrestaurant.com/wp-content/gallery/chicago/132.jpeg",
							url: "http://lasfuentesrestaurant.com/",
							reservations: "yes",
							created_at: Date.today() - 10

Venue.create	name: "Ranalli's",
							address1: "1925 N Lincoln Ave",
							address2: "",
							zipcode: "60614",
							state: "IL",
							city: "Chicago",
							neighborhood: "Lincoln Park",
							cuisine: "Pizza",
							desc: "Pizza restaurant and bar in Lincoln Park. The large patio is an excellent choice for a group in the summer.",
							photo_url: "http://ranallislincolnpark.com/wp-content/uploads/2014/06/website1.jpg",
							url: "http://ranallislincolnpark.com/",
							reservations: "no",
							created_at: Date.today()

Venue.create	name: "Foreign Cinema",
							address1: "2534 Mission St",
							address2: "",
							zipcode: "94110",
							state: "CA",
							city: "San Francisco",
							neighborhood: "Mission",
							cuisine: "American/Mediterranean",
							desc: "We offer a daily changing California/Mediterranean-inspired menu in an industrial chic setting located in the heart of the bustling Mission district. Dinner is served nightly as well as weekend brunch both Saturday and Sunday. Foreign and independent films are screened in our covered outdoor courtyard. Seating is available indoors fireside as well as upstairs in our semi-private mezzanine overlooking the dining room. Guests may enjoy cocktails and our complete menu from the main bar or on the patio outside. Modernism West, an art gallery in collaboration with Martin Muller and Modernism Inc, is open to the public most nights and is an ideal space for private dining. After dinner drinks with rotating DJ’s completes the evening in our adjacent bar, Laszlo.",
							photo_url: "http://www.foreigncinema.com/silvernitrate/wp-content/uploads/2014/01/jt-5218_original.jpg",
							url: "http://www.foreigncinema.com/",
							reservations: "yes",
							created_at: Date.today() - 6

Venue.create	name: "Don Pisto’s",
							address1: "510 Union St",
							address2: "",
							zipcode: "94133",
							state: "CA",
							city: "San Francisco",
							neighborhood: "North Beach/Telegraph Hill",
							cuisine: "Mexican",
							desc: "The Mexican fare at this North Beach spot is as good as anything in the Mission declare fans of its authentic flavors and excellent takes on street food; the lovely space with exposed-brick walls is overseen by a pleasant hipster staff, though there are sometimes crazy waits for weekend brunch.",
							photo_url: "http://bakingmehungry.files.wordpress.com/2013/01/mg_4567.jpg",
							url: "http://www.donpistos.com/",
							reservations: "yes",
							created_at: Date.today() - 1

Venue.create	name: "BarBacon",
							address1: "836 Ninth Ave",
							address2: "",
							zipcode: "10019",
							state: "NY",
							city: "New York",
							neighborhood: "Midtown West",
							cuisine: "American/Bacon",
							desc: "Life is better with bacon in it, and this Midtown American gastropub is a popular place to pig out on quality cured swine in all forms, spectacular bacon flights included; willing staffers also decant a lengthy whiskey list in the simple, loud setting.",
							photo_url: "http://blog.forbestravelguide.com/wp-content/uploads/2014/03/FTG-NewNYCBars-CreditBarBacon.jpg",
							url: "http://barbacon.com/",
							reservations: "yes",
							created_at: Date.today() - 5

Venue.create	name: "Otto Pizzeria",
							address1: "1 5th Ave",
							address2: "",
							zipcode: "10003",
							state: "NY",
							city: "New York",
							neighborhood: "Greenwich Village",
							cuisine: "Italian/Pizza",
							desc: "Energetic to say the least, this happening enoteca/pizzeria from the Batali-Bastianich crew lures lots of families and NYU students with fantastic pizzas and pastas, a huge wine list and decent prices; it's a perennially packed, fun, loud scene – especially in the Italian train station–themed front bar.",
							photo_url: "http://nyu.spoonuniversity.com/wp-content/uploads/sites/7/2013/11/otto-dining-room-1.jpg",
							url: "http://ny.ottopizzeria.com/",
							reservations: "yes",
							created_at: Date.today() - 7

Venue.create	name: "Lure Fishbar",
							address1: "142 Mercer St",
							address2: "",
							zipcode: "10012",
							state: "NY",
							city: "New York",
							neighborhood: "SoHo",
							cuisine: "Seafood",
							desc: "It's quite the scene at this packed SoHo cellar seafooder where the fresh catch is perfectly cooked and on par with the classy, cruise-ship decor; though tabs are steep and the ebullient, mixed-age crowd can kick up a racket, most consider it an all-around winner.",
							photo_url: "https://nyppagesix.files.wordpress.com/2013/09/lure2.jpg",
							url: "http://www.lurefishbar.com/",
							reservations: "",
							created_at: Date.today()-10					

puts "Seeds updated."

# Venue.create	name: "",
# 							address1: "",
# 							address2: "",
# 							zipcode: "",
# 							state: "",
# 							city: "",
# 							neighborhood: "",
# 							cuisine: "",
# 							desc: "",
# 							photo_url: "",
# 							url: "",
# 							reservations: ""