# Declare global variable
@students = []
# prints header for Villains Academy
def print_header
  # If list has no names, method returns nothing
  if @students.length > 0
    puts "\nThe students of our Villain's Academy as defined by you, me and Dupree"
    puts "-------------"
  else
    puts "No students in this years cohort, sorry and goodbye"
  end
end

# prints names in defined pattern for each key value array.
def print_student_list
  if @students.length > 0
    # each with index adds index before each puts statement
    @students.each_with_index() do |student, index|
      # offset puts by one
      start_at_one = index + 1
      puts "#{start_at_one}. #{student[:name]}, #{student[:cohort]}, Favourite hobby #{student[:hobby]}"
    end
  end
end


def print_footer
  # If list has no names, method returns nothing
  if @students.length > 0
    puts "Overall, we have #{@students.length} great students \n\n"
  end
end

def input_students
  while true
    puts "Please enter the names of the Students"
    puts "To finish, type exit".center(40)
    # get the students names
    name = STDIN.gets.strip.capitalize
      if name == "Exit"
        break
      end
    # Requesting cohort from user
    puts "Please enter a cohort for this student"
    cohort = STDIN.gets.chomp.capitalize
      if cohort == ""
        cohort = "November"
      end
    # Requesting favourite hobby
    puts "Please enter the students favourite hobby if known"
    hobby = STDIN.gets.chomp.capitalize
      if hobby == ""
        hobby = "Coding"
      end
    # adds the student hash to the array with predefined cohort
    add_student(name, cohort, hobby)
    if @students.count == 1
      puts "Now we have #{@students.count} student".center(40)
    else
      puts "Now we have #{@students.count} students".center(40)
    end
  end
  @students
end

def add_student(name, cohort, hobby)
  @students << {name: name, cohort: cohort, hobby: hobby}
end

# Currently unused after adding interactive interactive
# Sorts hashes into cohorts
def sort
  if @students.length > 0
    puts "Would you like to sort by cohort (yes/no)"
    input = gets.chomp
    if input == "yes"
      sorted = {}
      @students.each do |term|
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
  loop do
    # 1. print the menu and ask the user what to do
    print_menu
    # 2. read the input and save it into a variable
    process(STDIN.gets.chomp)
    # 3. do what the user has asked
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit" # 9 because we'll be adding more items
end

def save_students
  # open the file for writing
  file = File.open("students.csv", "w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort], student[:hobby]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
  name, cohort, hobby= line.chomp.split(',')
    add_student(name, cohort, hobby)
  end
  file.close
end

def try_load_students
  filename = ARGV.first # first argument from the command line
  if filename.nil? # If no file name then set filename to students.csv
    filename = "students.csv"
  end
  if File.exists?(filename) # if it exists
    load_students(filename)
     puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    exit # quit the program
  end
end

def show_students
  print_header
  print_student_list
  print_footer
end

def process(selection)
  case selection
    when "1"
      input_students
      puts "\nThank you for adding students to the cohort!\n\n"
    when "2"
      show_students
    when "3"
      save_students
      puts "\nStudents have successfully been saved Jimmy boy!\n\n"
    when "4"
      load_students
      puts "\nStudents have successfully been loaded MacTavish!\n\n"
    when "5"
      puts @students
    when "9"
      exit
    else
      puts "I don't know what you mean, try again"
  end
end

try_load_students
interactive_menu
