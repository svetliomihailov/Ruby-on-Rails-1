puts 'Creating categories!'

Category.find_or_create_by name: 'Laptops'
Category.find_or_create_by name: 'Televisions'
Category.find_or_create_by name: 'Smartphones'