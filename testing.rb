# and then print them with iteration
def print_header
  puts "The students of my Villains Academy as defined by you, me and Dupree"
  puts "-------------"
end

def print(names)
  x = 1
  names.each_with_index() do |student, index|
    start_at_one = index + 1
    puts "#{start_at_one}. #{student[:name]}, #{student[:cohort]}, Favourite hobby #{student[:hobby]}"
    x += 1
  end
end

def print_footer(names)
  puts "Overall, we have #{names.length} great students"
end

def input_students
  # empty students array
  students = []
  while true
    puts "Please enter the names of the Students"
    puts "To finish, type exit".center(40)
    # get the students names
    name = gets.chomp.capitalize
      if name == "Exit"
        break
      end
    # Requesting cohort from user
    puts "Please enter a cohort for this student"
    cohort = gets.chomp.capitalize
      if cohort == ""
        cohort = "November"
      end
    # Requesting favourite hobby
    puts "Please enter the students favourite hobby if known"
    hobby = gets.chomp.capitalize
      if hobby == ""
        hobby = "Coding"
      end
    # adds the student hash to the array with predefined cohort
    students << {name: name, cohort: cohort, hobby: hobby}
    puts "Now we have #{students.count} students".center(40)
  end
  students
end

students = input_students
print_header
print(students)
print_footer(students)
