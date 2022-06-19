Product.destroy_all

product_id_array = []

50.times do |index|
  Product.create!(name: Faker::Lorem.word, cost: Faker::Number.within(range: 1..10), country_of_origin: Faker::Lorem.word)

  product_id_array.push(Product.last.id)
end

p "Created #{Product.count} products"

p product_id_array

product_id_array.each do |num|
  5.times do |index|
    Review.create!(author: Faker::Lorem.word, content_body: Faker::Lorem.paragraph_by_chars(number: 50), rating: Faker::Number.within(range: 1..5), product_id: num)
  end
end

p "Create #{Review.count} reviews"