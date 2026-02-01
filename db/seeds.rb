# db/seeds.rb
Book.destroy_all

Book.create!(title: "Common Book", published_date: "2020-01-01", price: 10)

if Rails.env.development?
    4.times { |i| Book.create!(title: "Dev Book #{i+1}", published_date: "2024-01-01", price: 20) }
    puts "Created 1 common and 4 development books!"
elsif Rails.env.production?
    4.times { |i| Book.create!(title: "Prod Book #{i+1}", published_date: "2026-01-01", price: 50) }
    puts "Created 1 common and 4 production books!"
end
