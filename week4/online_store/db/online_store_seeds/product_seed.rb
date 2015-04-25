puts 'Creating products!'

unless Product.find_by_name 'LCD TV'
  p = Product.new
  p.name = 'LCD TV'
  p.price = BigDecimal.new '499.99'
  p.quantity = 23
  p.category = Category.find_by_name 'Televisions'
  p.brand = Brand.find_by_name 'Samsung'
  p.save!
end

unless Product.find_by_name 'Asus Ultrabook'
  p = Product.new
  p.name = 'Asus Ultrabook'
  p.price = BigDecimal.new '499.99'
  p.quantity = 56
  p.category = Category.find_by_name 'Laptops'
  p.brand = Brand.find_by_name 'Asus'
  p.save!
end
