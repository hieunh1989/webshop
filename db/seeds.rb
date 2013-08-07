puts "Create Admin ..."
Fabricate(:user, role: Settings.roles.admin, email: Settings.admin_email)

puts "Create 100 users ..."
100.times do
  Fabricate(:user)
end

puts "Create product ..."
50.times do
  p = Fabricate(:product, price: Settings.prices.sample)
  3.times do  
    p.product_images << ProductImage.create!(photo: File.open("#{Rails.root}/app/assets/images/product_images/#{rand(1..12)}.jpg"))
  end
end 

puts "Create comment ..."
50.times do
  Fabricate(:comment, user: User.all.sample, product: Product.all.sample)
end 
