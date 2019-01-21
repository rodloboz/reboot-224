def ask_for(action)
  puts "What's your #{action}?"
  print "> "

  gets.chomp
end

# player[:name] / player[:balance]
#                 'John'
def create_player(name)
  { name: name, balance: 50}
end

def update_balance(player, bet, result)
  if result == :win
    player[:balance] += bet * 0.25
  else
    player[:balance] += -bet
  end
end
