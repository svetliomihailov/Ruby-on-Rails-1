# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require_relative 'online_store_seeds/brand_seed'
require_relative 'online_store_seeds/category_seed'

# Products seed must be after the Brand and Category seeds1
require_relative 'online_store_seeds/product_seed'
