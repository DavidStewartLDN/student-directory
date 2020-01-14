# and then print them with iteration
def print_header
  puts "The students of my Villains Academy as defined by you, me and Dupree"
  puts "-------------"
end
def print(names)
  names.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end
def print_footer(names)
  puts "Overall, we have #{names.length} great students"
end

def input_students
  puts "Please enter the names of the Students"
  puts "To finish, just hit that return key twice"
  # empty students array
  students = []
  # get the students names
  name = gets.chomp
  # while loop for when name is not empty, repeat this code
  while !name.empty? do
    # adds the student hash to the array with predefined cohort
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets.chomp
  end
  # return the array of students
  students
end

students = input_students
print_header
print(students)
print_footer(students)
