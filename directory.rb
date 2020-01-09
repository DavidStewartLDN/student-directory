# printing out the list of students we have at Villain Academy
students = [
  "Dr. Hannibal Lecter",
  "Darth Vader",
  "Nurse Ratched",
  "Michael Corleone",
  "Alex DeLarge",
  "The Wicked Witch of the West",
  "Terminator",
  "Freddy Krueger",
  "The Joker",
  "Joffrey Baratheon",
  "Norman Bates"
]
# and then print them with iteration
puts "The students of Villains Academy"
puts "-------------"
students.each do |name|
  puts name
end
# prints the total number of students
puts "Overall, we have #{students.length} great students"
