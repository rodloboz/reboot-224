# welcome message
# display inventory # => Hash
# === START LOOP
# ask user what item
# update the CART
# ask for another item
# / unless they want to buy more
# === STOP LOOP
# show bill (checkout)
#   go through items one by one (#each)
#   read price from STORE
#   add total

# STORE = {
#           "kiwi" => 1.2
#         }

# CART = {} / [strings]

STORE = {
  "kiwi" => {
    price: 1.25,
    stock: 5
  },
  "banana" => {
    price: 0.5,
    stock: 4
  },
  "mango" => {
    price: 4.0,
    stock: 1
  },
  "asparagus" => {
    price: 9.0,
    stock: 5
  }
}

CART = Hash.new(0)

def welcome
  puts "Welcome to Instacart"
  puts "===================="
  puts "\n"
end

def display_store
  puts "In our store today:"
  STORE.each do |item, value|
    puts "#{item}: #{value[:price]}€ (#{value[:stock]} available)"
  end
end

def ask_for_item
  puts "Which item? ('quit' to checkout)"
  gets.chomp.downcase
end

def ask_for_amount
  puts "How many?"
  gets.chomp.to_i
end

def message_for_invalid_item
  puts "Sorry, we don't have that item"
end

def message_for_unavailable_stock(item)
  puts "Sorry, there are only #{STORE[item][:stock]} #{item} left.."
end

def update_cart(item, amount)
  CART[item] += amount
end

def update_store(item, amount)
  STORE[item][:stock] -= amount
end

def checkout
# show bill (checkout)
#   go through items one by one (#each)
#   read price from STORE
#   add total
  total = 0
  puts "-------BILL---------"

  CART.each do |item, amount|
    subtotal = 0
    price = STORE[item][:price]

    subtotal += price * amount
    total += subtotal
    puts "#{item}: #{amount} X #{price}€ = #{subtotal}€"
  end

  puts "TOTAL: #{total}€"
  puts "--------------------"
end

welcome
display_store

loop do
  item = ask_for_item

  break if item =~ /q(uit)?/i

  amount = ask_for_amount

  if STORE[item].nil?
    message_for_invalid_item
  elsif STORE[item][:stock] < amount
    message_for_unavailable_stock(item)
  else
    update_cart(item, amount)
    update_store(item, amount)
  end
end

checkout unless CART.values.empty?










