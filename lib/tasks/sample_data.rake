namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(name: "Garrett",
                         email: "garrettcura@gmail.com",
                         password: "f5K-bB4-Xpn-DkM",
                         password_confirmation: "f5K-bB4-Xpn-DkM",
                         admin: true)
                         
   admin = User.create!(name: "Spencer",
                         email: "Spencer.Henderson1013@gmail.com",
                         password: "spencer1",
                         password_confirmation: "spencer1",
                         admin: true)  
                         
   users = User.all(limit: 6)
    50.times do
      content = Faker::Lorem.sentence(5)
      users.each { |user| user.ads.create!(content: content) }
    end                                          
   end
end