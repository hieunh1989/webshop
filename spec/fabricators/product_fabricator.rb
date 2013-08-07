Fabricator(:product) do 
  name { Faker::Commerce.product_name}
  description { Faker::Lorem.sentence(50)}
end