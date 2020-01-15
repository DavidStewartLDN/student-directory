# prints header for Villains Academy
def print_header(names)
  # If list has no names, method returns nothing
  if names.length > 0
    puts "\nThe students of our Villain's Academy as defined by you, me and Dupree"
    puts "-------------"
  else
    puts "No students in this years cohort, sorry and goodbye"
  end
end

# prints names in defined pattern for each key value array.
def print(names)
  if names.length > 0
    # each with index adds index before each puts statement
    names.each_with_index() do |student, index|
      # offset puts by one
      start_at_one = index + 1
      puts "#{start_at_one}. #{student[:name]}, #{student[:cohort]}, Favourite hobby #{student[:hobby]}"
    end
  end
end


def print_footer(names)
  # If list has no names, method returns nothing
  if names.length > 0
    puts "Overall, we have #{names.length} great students \n\n"
  end
end

def input_students
  # empty students array
  students = []
  while true
    puts "Please enter the names of the Students"
    puts "To finish, type exit".center(40)
    # get the students names
    name = gets.strip.capitalize
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
    if students.count == 1
      puts "Now we have #{students.count} student".center(40)
    else
      puts "Now we have #{students.count} students".center(40)
    end
  end
  students
end

# Currently unused after adding interactive interactive
# Sorts hashes into cohorts
def sort(hash)
  if hash.length > 0
    puts "Would you like to sort by cohort (yes/no)"
    input = gets.chomp
    if input == "yes"
      sorted = {}
      hash.each do |term|
        name = term[:name]
        cohort = term[:cohort]
        hobby = term[:hobby]
        if sorted[cohort] == nil
          sorted[cohort] = []
        end
      sorted[cohort].push(name)
      end
      sorted.each do |key, value|
        puts "#{key} cohort contains: #{value.join(', ')}"
      end
    end
  end
end

def interactive_menu
  students = []
  loop do
    # 1. print the menu and ask the user what to do
    puts "1. Input the students"
    puts "2. Show student list"
    puts "9. Exit"
    # 2. read the input and save it into a variable
    selection = gets.chomp
    # 3. do what the user has asked
    case selection
    when "1"
      students = input_students
    when "2"
      print_header(students)
      print(students)
      print_footer(students)
    when "9"
      exit # this will cause the program to terminate
    else
      puts "You ain't talkin my language, say that again?"
    end
  end
end

interactive_menu
