Fabricator(:comment) do 
  content { Faker::Lorem.sentence(50) }
end