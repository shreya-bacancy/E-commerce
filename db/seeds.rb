# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

# 5.times do
# 	i=1
# 	User.create(name:"test#{i}",
# 		email: "test#{i}@gmail.com",
# 		password: "123456",
# 		address: "ram nagar #{i}",
# 		city: "nimbhahera",
# 		state: "rajasthan",
# 		pincode: 312601,
# 		dob: Faker::Date.birthday(min_age: 18, max_age: 65),
# 		contact_no: "7300#{i}66751"
# 		)
# 	i=i+1
# end

# 5.times do
# 	i=0
# 	Supplier.create(
# 		contact_name: Faker::Name.name,
# 		company_name: Faker::Company.name,
# 		contact_number: Faker::PhoneNumber.cell_phone,
# 		email: Faker::Internet.email,
# 		password: "123456",
# 		address: Faker::Address.street_address,
# 		city: Faker::Address.city,
# 		state: Faker::Address.state,
# 		country: Faker::Address.country
# 		)

# end


suppliers = Supplier.all
lapNames=["HP","Dell","MAC","ACER"]
suppliers.each do |supplier|
lapNames.each do |name|
	i=0
	product = Product.new(
		name: name,
		color: "rose gold",
		price: 70000,
		status: 1,
		size: "5",
		stock: i,
		description: "jgjhk",
		category_id: 2,
		sold_by: supplier.company_name,
		supplier_id: supplier.id,
		memoryStorage: "64GB",
		operatingSystem: "iOS 14",
		brand: name
		)	
		product.images.attach(
		io: File.open('app/assets/images/hp.png'),
		filename: 'hp.png'
		)
		i+=1
		product.save
end
end

suppliers = Supplier.all
suppliers.each do |supplier|
1.times do
	i=0
	product = Product.new(
		name: Faker::Device.model_name,
		color: Faker::Color.color_name,
		price: Faker::Number.number(digits: 5),
		status: 1,
		size: "5.3",
		stock: i,
		description: Faker::Lorem.paragraph(sentence_count: 5),
		category_id: 1,
		sold_by: supplier.company_name,
		supplier_id: supplier.id,
		memoryStorage: "64GB",
		operatingSystem: "iOS 14",
		brand: Faker::Device.manufacturer
		)	
		product.images.attach(
		io: File.open('app/assets/images/iphone.jpg'),
		filename: 'iphone.jpg'
		)
		i+=1
		product.save
end
end

suppliers = Supplier.all
suppliers.each do |supplier|
brand = ["Sony", "Panasonic", "Shift", "GoPro", "DJI"]
cameraName = ["Sony Alpha ILCE-7RM3 Full-Frame 42.4MP Mirrorless Camera Body (4K Full Frame,
 Real-Time Eye Auto Focus, Real time Animal Eye AF, Tiltable LCD)", 
 "Shift IZI Nano Drone Camera 5MP FHD 1080P Patented 3D-Sensing Controller Autonomous Follow Me Mode 
 17 Mins Fly time Quadcopter"]
brand.each do |name|
	cameraName.each do |camera|
	i=1
	product = Product.new(
		name: camera,
		color: Faker::Color.color_name,
		price: Faker::Number.number(digits: 5),
		status: 1,
		size: "5.3",
		stock: i,
		description: Faker::Lorem.paragraph(sentence_count: 5),
		category_id: 3,
		sold_by: supplier.company_name,
		supplier_id: supplier.id,
		memoryStorage: "64GB",
		brand: name
		)	
		product.images.attach(
		io: File.open('app/assets/images/sony.jpg'),
		filename: 'sony.jpg'
		)
			i+=1
		product.save
	end
end
end


suppliers = Supplier.all
suppliers.each do |supplier|
brand = ["Sony", "Panasonic", "Shift", "GoPro", "DJI"]

brand.each do |name|
	
	i=1
	product = Product.new(
		name: name,
		color: Faker::Color.color_name,
		price: Faker::Number.number(digits: 5),
		status: 1,
		size: "32 inches",
		stock: i,
		description: Faker::Lorem.paragraph(sentence_count: 5),
		category_id: 4,
		sold_by: supplier.company_name,
		supplier_id: supplier.id,
		model: "32Y1",
		model_year: 2020,
		resolution: "1366 x 768 pixels",
		display_technology: "LED",
		connector_type: "Wi-Fi, USBs",
		brand: name
		)	
		product.images.attach(
		io: File.open('app/assets/images/tv.png'),
		filename: 'tv.png'
		)
			i+=1
		product.save
	end
end
