# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Alcohol.destroy_all()
User.destroy_all()


users = ["user@user.com","justin@email.com","luke@email.com"]
alcohols = ["Jim Beam", "Jack Daniels", "Woodford Reserve", " Jamerson's Irish Whisky", "Congnac"]
mixers = ["Coke","Sprite","Tonic Water","Soda Water","Ginger Beer"]



users.each do |user|
    User.create!(
        username: user,
        password: "password",
        password_confirmation: "password",
      )
      puts "User Account created for #{user}"
end

User.create!(
  username: "admin@admin.com",
  password: "password123",
  password_confirmation: "password123",
  admin:true
)


alcohols.each do |alcohol|

  Alcohol.create!(
    name: alcohol,
    volume_in_ml: 60,
    user_id: User.all.pluck(:id).sample
  )

  puts "New Alcohol Created #{alcohol}"
end

mixers.each do |mixer|

  Mixer.create!(
    name: mixer,
    volume_in_ml: 280,
    user_id: User.all.pluck(:id).sample
  )

  puts "New Mixer Created #{mixer}"
end

