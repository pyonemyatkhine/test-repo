# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#
# Test data of products
#
('A'..'Z').each do |name|
Product.create(name: "product#{name}", price: [100, 200, 300, 400].sample)
end

30.times do
  products = Product.all.shuffle
  order = Order.new

  # Add 3 to 5 number of product per order.
  (3..5).to_a.sample.times do
    order.order_details.build(product: products.shift, count:  (1..4).to_a.sample)
  end
order.save
end
