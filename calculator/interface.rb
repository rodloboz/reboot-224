# DUMB CALCULATOR
# welcome user
# === START LOOP ===
# ask for the first number
# => String convert to Integer
# ask for the second number
# => String convert to Integer
# ask which operation (+ - / *)
# => String ( 4 possibilities) IF/ELSIF || CASEOn
# run the operation on the 2 numbers => Integer
# display the result
# ask user if they want to continue
# === END LOOP ===
# goodbye message


def welcome
  puts "Welcome to Simple Calculator"
  puts "============================"
end

def ask_for_number(ordinal)
  puts "Type #{ordinal} number:"
  print "> "

  gets.chomp.to_i
end

def ask_for_operation
  puts "Which operation: [+][-][/][*]"
  print "> "

  gets.chomp
end

def calculator(first_number, second_number, operator)
  case operator
  when "+"
    first_number + second_number
  when  "-"
    first_number - second_number
  when "/"
    first_number / second_number
  when "*"
    first_number * second_number
  end
end

welcome

# start loop
choice = nil
until choice =~ /^no?$/i # stop when condition is true
  first_number = ask_for_number(:first)
  second_number = ask_for_number(:second)
  operator = ask_for_operation
  result = calculator(first_number, second_number, operator)
  puts "Result: #{result}"
  puts "Do you want to continue? [y/n]"
  choice = gets.chomp
end
