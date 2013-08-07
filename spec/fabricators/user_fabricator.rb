Fabricator(:user) do
  email { Faker::Internet.email }
  password  'vinova'
  password_confirmation  'vinova'
  first_name { Faker::Name.first_name}
  last_name { Faker::Name.last_name}
  role { Settings.roles.customer }
end