class Player
  attr_accessor :name, :life_points

  def initialize(name)
    @name = name
    @life_points = 10
  end


  def show_state
    if @life_points > 0
    puts "#{@name} a #{@life_points} point(s) de vie."
    else @life_points <= 0
    puts "#{@name} est KO"
  end


  def gets_damage(damage_received)
    @life_points = @life_points - damage_received 
  end


  def attacks(attacked_player)
    print "#{@name} attaque #{attacked_player.name} \n"
    damage_received = compute_damage
    attacked_player.gets_damage(damage_received)
    puts "Il lui inflige #{damage_received} point(s) de dommages \n"

    if attacked_player.life_points <= 0
    puts "#{attacked_player.name} a été tué !"
    end

  end


  def compute_damage
    rand(1..6)
  end
end


class HumanPlayer
  attr_accessor :name, :life_points, :weapon_level

  def initialize(name)
    @name = name
    @life_points = 100
    @weapon_level = 1
  end


  def show_state
    puts "#{@name} a #{@life_points} point(s) de vie et une arme de niveau #{@weapon_level}."
  end


  def compute_damage
    rand(1..6) * @weapon_level
  end


  def gets_damage(damage_received)
    @life_points = @life_points - damage_received 
  end


  def search_weapon
    new_weapon = rand(1..6)
    puts "Tu as trouvé une arme de niveau #{new_weapon}"

    if new_weapon > @weapon_level
      new_weapon = @weapon_level
      puts "Youhou ! elle est meilleure que ton arme actuelle : tu la prends."

    else new_weapon <= @weapon_level
      puts "M@*#$... elle n'est pas mieux que ton arme actuelle..."
    end
  
  end

  def

  def search_health_pack
    new_health_pack = rand(1..6)
    if new_health_pack == 1
      puts "Tu n'as rien trouvé... "

    elsif new_health_pack >= 2 && new_health_pack <= 5
      life_points = @life_points +50
      puts "Bravo, tu as trouvé un pack de +50 points de vie !"

    else new_health_pack == 6
      life_points = @life_points + 80
      puts "Waow, tu as trouvé un pack de +80 points de vie !"
    end
      if new_points > 100
        @life_points = 100
      else
        @life_points = new_points
      end

  end


  def attacks(attacked_player)
    print "#{@name} attaque #{attacked_player.name} \n"
    damage_received = compute_damage
    attacked_player.gets_damage(damage_received)
    puts "Tu lui infliges #{damage_received} point(s) de dommages \n"
    
    if attacked_player.life_points <= 0
    puts "#{attacked_player.name} a été tué !"
    end

  
  end
end
end