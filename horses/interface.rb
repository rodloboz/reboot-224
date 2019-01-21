# welcome user
# ask player name
# create the player with a balance
# === START LOOP ===
# display list of horses => Array[Strings]
# ask player to pick a horse
# ask how much they want to bet
# run the race
# pick a random winner => Array#sample
# determine if player picked winner
# update player balance
# display result message
# check if game over => balance <= 0
# Ask player if they want to race again
# === END LOOP ===
# Goodbye message

# player = {name: "Rui", balance: 50 }

# 1) Make it work for a single race
# 2) Make it work for multiple races
# 3) Player can go broke

require_relative 'welcome'
require_relative 'player'
require_relative 'horses'

MINIMUM_BET = 10
HORSES = [
  "Seabiscuit",
  "Speedy",
  "Guadalupe",
  "Lucky Luke",
  "Eye of the Tiger",
  "Michael Bolton",
  "Ghost",
  "Ruby"
]

welcome
name = ask_for(:name)
player = create_player(name)

loop do
  puts "Here is the starting roster:"
  display_horses(HORSES)

  puts "Choose between 1 and #{HORSES.size}"
  index = ask_for(:pick).to_i - 1

  until (1..HORSES.size).include? index
    puts "Invalid choice. Pick a number between 1 and #{HORSES.size}"
    index = ask_for(:pick).to_i - 1
  end

  player_pick = HORSES[index]

  player_bet = ask_for(:bet).to_i

  until player_bet >= MINIMUM_BET
    puts "Type a valid amount!"
    player_bet = ask_for(:bet).to_i
  end

  winner = HORSES.sample

  if player_pick == winner
    update_balance(player, player_bet, :win)
    puts "Congrats! You won!"
  else
    update_balance(player, player_bet, :lost)
    puts "Ooops! You lost!"
  end

  if player[:balance] <= MINIMUM_BET
    puts "Game over! You're bust!"
    break
  end

  puts "Do you want to race again? (y/n)"
  answer = gets.chomp

  break if answer =~ /^n(o)?$/i
end

puts "Goodbye"









