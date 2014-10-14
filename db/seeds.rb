# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'

user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email

CSV.foreach('db/merchants.csv', headers:true) do |row| 
	merch = Merchant.create(name: row['Company'].rstrip, description: row['Description'], phone: row['Phone'])
end

CSV.foreach('db/flowers.csv', headers:true) do |row|
	flower = Flower.create(strain: row['strain'].rstrip, kind: row['kind'], description: row['Description'], quantity_price: row['Quantity/Price'])
	flower.merchants << Merchant.find_by_name(row['Company'].rstrip)
end

CSV.foreach('db/edibles.csv', headers:true) do |row| 
	edible = Edible.create(name: row['name'].rstrip, description: row['Description'], price: row['Price'])
	edible.merchants << Merchant.find_by_name(row['Company'].rstrip)
end

CSV.foreach('db/concentrates.csv', headers:true) do |row|
	concentrate = Concentrate.create(strain: row['Strain'].rstrip, fees: row['fees'], quantity_price: row['Quantity/Price'], kind: row['kind'])
	concentrate.merchants << Merchant.find_by_name(row['Company'].rstrip)
end

#Merchant.find_by_name("Boulder Botanics").flowers << Flower.find_by_strain("Bubba Kush")


# colo_concentrates = Merchant.find_by_name("Colorado Concentrates")
# craft_c = Merchant.find_by_name("Craft Concentrates")

# craft_c.concentrates << Concentrate.find_by_strain("Trim Processing")
# Merchant.find_by_name("Lab 710").concentrates << Concentrate.find_by_strain("Trim Processing")
# Merchant.find_by_name("Green Dot").concentrates << Concentrate.find_by_strain("Trim Processing")

# concentrate_strains = ["Sour Kush","Sour D","Pre 98","Golden Goat","Sativa","Hybrid","Sour D", "Trim Processing", "Trim Processing", "Trim Processing"]

# colo_concentrates.concentrates << Concentrate.find_by_strain(concentrate_strains.shift)
# 6.times do 
# 	craft_c.concentrates << Concentrate.find_by_strain(concentrate_strains.shift)
# end


# edibles = ["Quad Dose","Deca Dose","High CBD","Pure CBD","Caramel","Mint Chocolate Chew","Green Hornet","Blueberry Bliss","Boulder Bar","Cookies and Creme","Firecracker" ,"Monkey Bar","Peach Dream","Strawberry Crunch","Peanut Budda Buddha","Mile High Mint","Mile Higher Mint","Fire Berry","Mikiba"]

# cheeba_chews = Merchant.find_by_name("Cheeba Chews")
# incredibles = Merchant.find_by_name("Incredibles")

# 7.times do 
# 	cheeba_chews.edibles << Edible.find_by_name(edibles.shift)
# end

# 12.times do 
# 	incredibles.edibles << Edible.find_by_name(edibles.shift)
# end

7.times do 
	m = Merchant.all.sample 
	m.premium = true
	m.save
end


