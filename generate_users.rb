#Hashes password
require "digest/md5"
password = "password"
hashed_password = Digest::MD5.hexdigest(password)

#Generate 1000 unique emails
f = File.new("./english-dictionary.txt", "r")
words = f.read.split("\n")
f.close

#create 1000 emails
emails = []
1000.times do
  email = words.sample + "@gmail.com"
  emails.push(email)
end

#put 1000 emails into an array
data = {}
emails.each do |email|
  record = {
      "password" => "5f4dcc3b5aa765d61d8327deb882cf99",
      "favorite_color" => ["Blue", "Red", "Green"].sample,
      "favorite_animal" => ["Cheetah","Dog", "Cat", "Fish"].sample,
      "favorite_car" => ["Honda","Subaru", "Ford"].sample,
      "high_school" => ["Staples", "Ward", "Stamford"].sample,
      "favorite_food" => ["Pasta", "Pizza", "Salad"].sample
  }

#Store the record in the hash data at the key email
  data[email] = record
end

#Figure out how to output this data set as JSON
require 'json'
all_emails=JSON.generate(data)
puts all_emails
f = File.new("./All_Emails.txt", "w")
f.write (all_emails)
