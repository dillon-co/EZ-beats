User.create!(first_name:  "Example",
             last_name: "User",
             email: "example@example.com",
             password:              "password",
             password_confirmation: "password")

9.times do |n|
  first_name  = Faker::Name.first_name
  last_name  = Faker::Name.last_name
  email = Faker::Internet.email
  password = "password"
  User.create!(first_name:  first_name,
               last_name:   last_name,
               email: email,
               password:              password,
               password_confirmation: password)
end

users = User.all
