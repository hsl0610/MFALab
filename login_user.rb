#Requiring JSON
require 'json'
require "digest/md5"

#Get user info
puts "What's your email?"
email = gets.chomp
puts "What's your password?"
password = gets.chomp
hashed_password = Digest::MD5.hexdigest(password)

#Check if all info matches up
f = File.open("./All_Emails.txt", "r")
json_string = f.read
data = JSON.parse(json_string)
record = data[email]
if record == nil
  puts "Invalid Email"
  exit
elsif hashed_password != record["password"]
  puts "Invalid Password"
  exit
end

#Ask user random question
numbers = (1..5).to_a.sample
if numbers == 1
  puts "What is your favorite color? (Capitalize First Letter)"
  fav_color =  gets.chomp
  if fav_color !=record["favorite_color"]
    puts "ERROR! INVALID LOGIN"
    exit
  end
end
if numbers == 2
  puts "What is your favorite animal? (Capitalize First Letter)"
  fav_animal =  gets.chomp
  if fav_animal !=record["favorite_animal"]
    puts "ERROR! INVALID LOGIN"
    exit
  end
end
if numbers == 3
  puts "What is your favorite car? (Capitalize First Letter)"
  fav_car =  gets.chomp
  if fav_car !=record["favorite_car"]
    puts "ERROR! INVALID LOGIN"
    exit
  end
end
if numbers == 4
  puts "What high school did you go to? (Capitalize First Letter)"
  hi_school =  gets.chomp
  if hi_school !=record["high_school"]
    puts "ERROR! INVALID LOGIN"
    exit
  end
end
if numbers == 5
  puts "What is your favorite car? (Capitalize First Letter)"
  fav_food =  gets.chomp
  if fav_food !=record["favorite_food"]
    puts "ERROR! INVALID LOGIN"
    exit
  end
end

puts "Successful Login!!"