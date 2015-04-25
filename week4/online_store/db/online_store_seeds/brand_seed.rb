puts 'Creating brands!'

Brand.find_or_create_by name: 'Sony' do |brand|
  brand.description = 'A japanese company for electronics'
end

Brand.find_or_create_by name: 'Samsung' do |brand|
  brand.description = 'A south korean company for electronics'
end

Brand.find_or_create_by name: 'Asus' do |brand|
  brand.description = 'An awesome company for electronics'
end

Brand.find_or_create_by name: 'Apple' do |brand|
  brand.description = 'An expensive stuffs'
end