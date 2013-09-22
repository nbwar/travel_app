# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#


# excursion = Excursion.new()
excursions = [{name: 'Skiing in the Alps',
description: 'Enjoy a day of skiing down the Swiss Alps in some of the best snow in the world!',
price: '$500.00 USD',
image_url: 'Skiing_in_the_Alps.jpg',
link: 'http://www.destination360.com/europe/switzerland/images/s/skiing.jpg',
latitude: '46.5592° N',
longitude: '8.5614° E',
date: '9/29/13'},
{name: 'Helicopter ride in Zurich',
description: 'Catch a scenic view of Zurich via helicopter',
price: '$400.00 USD',
image_url: 'Helicopter_ride_in_Zurich.jpg',
link: 'http://www.destination360.com/europe/switzerland/skiing',
latitude: '47.3667° N',
longitude: ', 8.5500° E',
date: '9/30/13'},
{name: 'Cheese-making Tour',
description: 'Come see how fresh Swiss cheese is produced at our renowned factory!',
price: '$50.00',
image_url: 'Cheese-making_Tour.jpg',
link: 'http://fxcuisine.com/default.asp?language=2&Display=201&resolution=high',
latitude: '47.3667° N',
longitude: ', 8.5500° E',
date: '9/30/13'},
{name: 'Hot-air Balloon Ride',
description: 'Enjoy scenic Zurich via our unique hot air balloon!',
price: '$125.00',
image_url: 'Hot-air_Balloon_Ride.jpg',
link: 'http://beben-eleben.tumblr.com/image/36183202966',
latitude: '47.3667° N',
longitude: ', 8.5500° E',
date: '10/1/13'},
{name: 'Cruise on Lake Geneva',
description: 'Come enjoy a nice, relaxing cruise on Lake Geneva',
price: '$200.00',
image_url: 'Cruise_on_Lake_Geneva.jpg',
link: 'http://www.cruiselakegeneva.com/',
latitude: '42.5925° N',
longitude: '88.4344° W',
date: '10/2/13'},
{name: 'Giger Museum',
description: 'Come witness the works of renowned Swiss artist H. R. Giger at the Giger Museum',
price: '$40.00',
image_url: 'Giger_Museum.jpg',
link: 'http://www.hrgigermuseum.com/',
latitude: '46.5833° N',
longitude: '7.0833° E',
date: '10/3/13'},
{name: 'Wine tasting at Lake Geneva',
description: 'Sample world famous Swiss wines on the shores of Lake Geneva',
price: '$75.00',
image_url: 'Wine_tasting_at_Lake_Geneva.jpg',
link: 'http://travel.nationalgeographic.com/travel/best-trips-fall-2011/#/lavaux-switzerland_37633_600x450.jpg',
latitude: '46.5833° N',
longitude: '7.0833° E',
date: '10/4/13'},
{name: 'Tour Callier Factory',
description: 'Come witness how Swiss chocolate is made by taking a tour of the Callier chocolate factory',
price: '$40.00',
image_url: 'Tour_Callier_Factory.jpg',
link: 'http://www.lake-geneva-switzerland.com/freiburg-fribourg/visit-la-maison-cailler-chocolate-factory-near-gruyeres/',
latitude: '46.6000° N',
longitude: '7.1000° E',
date: '10/5/13'},
{name: 'Scenic train ride',
description: 'enjoy a scenic train ride and enjoy of the amazing natural beauty Switzerland has to offer',
price: '$100.00',
image_url: 'Scenic_train_ride.jpg',
link: 'http://www.wata.net/member.asp?member=39&theme=181&offer=153',
latitude: '46.6000° N',
longitude: '7.1000° E',
date: '10/6/13'}]


excursions.each{|e| Excursion.create(e)}

[{first_name:'Mo', last_name:'Latif', email:'m.latif@ee.ucl.ac.uk'},
{first_name:'Nick', last_name:'Wargnier', email:'nwargnier@gmail.com'},
{first_name:'Sai', last_name:'Arora', email:'sarora1190@gmail.com'}]

tg = TravelGroup.last
Excursion.all.each{ |ex| tg.excursions << ex }

private

def user_params
  params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
end

def travel_group_params
  params.require(:travel_group).permit(:name, :destination, :city, :state, :latitude, :longitude, :description, :start_date, :end_date)
end

def excrusion_params
  params.require(:excursion).permit(:name, :description, :price, :image_url, :link, :city, :state, :country, :latitude, :longitude, :date)
end

def suggestion_params
  params.require(:suggestion).permit(:vote_count, :travel_group, :excursion)
end

def vote_params
  params.require(:vote).permit(:user, :suggestion, :choice)
end
