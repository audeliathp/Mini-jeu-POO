require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts " --------------------------------------------------"
puts "| Bienvenue sur 'ILS VEULENT TOUS MA POO' !       |"
puts "| Le but du jeu est d'être le dernier survivant ! |"
puts " --------------------------------------------------"

#Create a Human Player
human_player = HumanPlayer.new('HumanPlayer')

#Create 2 players
player1 = Player.new('Zangief')
player2 = Player.new('Chun-Li')
enemies = [player1, player2]


#Fight will last until HumanPlayer is dead or both enemies have been killed
while human_player.life_points > 0 && (player1.life_points > 0 || player2.life_points >0)
  #Show state of each player
  puts "\n****************************************************\n"
  puts "   #{human_player.show_state} "
  puts "****************************************************\n"

  #Display options menu 
  if human_player.life_points > 0 
    print "Quelle action veux-tu effectuer ?\n"
    puts "\n a - chercher une meilleure arme \n"
    puts "\n s - chercher à se soigner \n"
    puts "\n attaquer un joueur en vue :\n"
    print "0 - "
    puts "#{player1.show_state} "
    print "1 - " 
    puts "#{player2.show_state} "

    #Get and handle HumanPlayer's choice 
    puts "> "
    puts option = gets.chomp
    case option
    when 'a'
      human_player.search_weapon
    when 's'
      human_player.search_health_pack
    when '0'
      human_player.attacks(player1)
    when '1'
      human_player.attacks(player2) 
    else 
      puts "Ceci n'est pas une option. Quelle action veux-tu effectuer ?"
      puts choice = gets.chomp
    end 

    #Enemies fight back
    enemies.each do |enemy|
      if enemy.life_points > 0
        puts "Les autres joueurs attaquent"
        enemy.attacks(human_player)
      end 
    end
  end

  #Game over
  puts "GAME OVER"
  if human_player.life_points > 0
    puts "YOU WIN !!!"
    else
      puts "LOOSER"
    end
  end
