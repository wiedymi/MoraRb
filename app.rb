$exp = 0
$level = 1
$exl = 0
$killedmob = 0
$killedboss = 0
$weapon = 0
$hp = 1
$armor = 0

puts "What's your name? "
$nickname = gets.chomp

def level(exp)
    if($exl >= 100)
        if($exl == 100)
            $level += 1
			puts ""
            puts "Yeahh! Level up!"
            $exp = 0
            $exl = 0
            puts "2"
        else
            $level += 1
            $exl = $exl - 100
            $exp = $exl
            puts "1"
        end
    else
        $exl += $exp
        puts "3"
    end
end

def showstat()
	puts ""
    puts "Welcome, #{$nickname}!"
    puts "Your level is #{$level}!"
    puts "Exp #{$exl}/100!"
	puts "HP #{$hp}/100!"
	puts "Weapon damage: #{$weapon}"
	puts "Armor: #{$armor}"
end

showstat()

def CreateABoss()
    mob = 100
	puts ""
    puts "The Boss"
    puts "=_+"
    puts " |---"
    puts "/|"
    puts "HP: #{mob}"
    until mob <= 0 || $hp <= 0 do
        puts "Do you want to attack? Yes/No"
        attack = gets.chomp
        if(attack.downcase == "yes")
            damageMob = $level + $weapon + rand(20)
            mob = mob - damageMob
			puts ""
            puts "The Boss -#{damageMob}hp"
            puts "=_+"
            puts " |---"
            puts "/|"
            puts "HP: #{mob}"
			damagePlayer = 5 + rand(5) - $armor
			$hp = $hp - damagePlayer
			puts ""
			puts "The Mob deals #{damagePlayer} damage"
			puts "Your HP: #{$hp}"
        else
			puts ""
            puts "You escaped the battle!"
        end
    end
	death()
	puts ""
    puts "Cangratulations! You killed the boss!"
    $exp += 30
	$killedboss += 1
    level($exp)
	healingPotion()
	loot()
    showstat()
    start()
end

def CreateAMob()
    mob = 10
	puts ""
    puts "The Mob"
    puts "=_+"
    puts "HP: 10"
    until mob <= 0 || $hp <= 0 do
        puts "Do you want to attack? Yes/No"
        attack = gets.chomp
        if(attack.downcase == "yes")
            damageMob = $level + $weapon + rand(5)
            mob = mob - damageMob
			puts ""
            puts "The Mob -#{damageMob}hp"
            puts "=_+"
            puts "HP: #{mob}"
			damagePlayer = 5 + rand(5) - $armor
			$hp = $hp - damagePlayer
			death()
			puts ""
			puts "The Mob deals #{damagePlayer} damage"
			puts "Your HP: #{$hp}"
        else
			puts ""
            puts "You escaped the battle!"
        end
    end
	death()
	puts ""
    puts "Cangratulations! You killed the mob!"
    $exp += 10
	$killedmob += 1
    level($exp)
	healingPotion()
	loot()
    showstat()
    if($killedmob == 5)
		puts ""
        puts "The boss!"
        puts "Accept the battle? Yes/No"
        accept = gets.chomp
        if(accept.downcase == "yes")
            CreateABoss()
        else
			puts ""
            puts "You escaped the battle!"
        end
    end
    start()
end

def loot()
	$chanceForLoot == rand(5)
	if($killedmob == 3)
		puts ""
		puts "You've found Caliburn!"
		puts "Do you want to equip it? Yes/No"
		loot = gets.chomp
		if(loot.downcase == "yes")
			$weapon = 10;
		else
			puts ""
			puts "You've remained Caliburn"
		end
	end
	if($killedboss == 1)
		puts ""
		puts "You've found Wolven armor!"
		puts "Do you want to equip it? Yes/No"
		loot = gets.chomp
		if(loot.downcase == "yes")
			$armor = 7;
			$killedboss = 0;
		else
			puts ""
			puts "You've remained Wolven armor"
		end
	end
end

def healingPotion()
	$chanceForHeal = rand(2)
	if ($chanceForHeal == 1)
		puts ""
		puts "You've found Healing Potion!"
		$hp = $hp + 30
		puts "Your health is restored by 30"
		if($hp > 100)
            $hp = 100
        end
		puts "Your HP: #{$hp}"
	end
end

def death()
	if ($hp <= 0)
		puts ""
		puts "You've been slain in this cruel world. #{$nickname} will always be remembered."
		puts "Do you want to start again?"
        puts "Yes/No"
        death = gets.chomp
		if (death.downcase == "yes")
			load 'app.rb'
		end
	end
end

def start()
	puts ""
    puts "Create a battle? Yes/No"
    start = gets.chomp
    if(start.downcase == "yes")
        CreateAMob()
    end
end

start()