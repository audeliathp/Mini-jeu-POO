require 'bundler'
require 'pry'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

#Create 2 players
player1 = Player.new('Zangiev')
player2 = Player.new('Chun-Li')


while player1.life_points > 0 && player2.life_points > 0
#Show state of each player
  puts "\----------------------------------- \n"
  puts "\nVoici l'état de chaque joueur : \n"
  puts player1.show_state
  puts player2.show_state

#Let'em fight
  puts "Ready? FIGHT !!! "
  puts player2.attacks(player1)
    break if player1.life_points <= 0 
  puts player1.attacks(player2)
  puts "-----------------------------------"
end
