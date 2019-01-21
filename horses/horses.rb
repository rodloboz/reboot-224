# 1 - Name of horse
# 2 - Name of another another

def display_horses(horses) # array of horses
  horses.each_with_index do |horse, index|
    puts "#{index + 1} - #{horse}"
  end
end
