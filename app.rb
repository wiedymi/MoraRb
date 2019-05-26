$exp = 0
$level = 1
$exl = 0
$killedmob = 0

puts "What's your name? "
$nickname = gets.chomp
def showstat()
    puts "Welcome, #{$nickname}!"
    puts "Your level is #{$level}!"
    puts "Exp #{$exl}/100!"
end
showstat()
def level(exp)
    if($exl >= 100)
        
        if($exl == 100)
            $level += 1
            puts "Yeahh! Level up!"
        else
            $exl = $exl - 100
            $exp = $exl
        end
    else
        $exl += $exp
    end
end

def CreateABoss()
    mob = 100
    puts "The Boss"
    puts "=_+"
    puts " |---"
    puts "/|"
    puts "HP: 100"
    until mob <= 0  do
        puts "Do you want to attack? Yes/No"
        attack = gets.chomp
        if(attack.downcase == "yes")
            damage = $level + rand(20)
            mob = mob - damage
            puts "The Boss -#{damage}hp"
            puts "=_+"
            puts " |---"
            puts "/|"
            puts "HP: #{mob}"
        else
            puts "You escaped the battle!"
        end
    end
    puts "Cangratulations! You killed the boss!"
    $exp += 10
    level($exp)
    showstat()
    start()
end


def CreateAMob()
    mob = 10
    puts "The Mob"
    puts "=_+"
 
    puts "HP: 10"
    until mob <= 0  do
        puts "Do you want to attack? Yes/No"
        attack = gets.chomp
        if(attack.downcase == "yes")
            damage = $level + rand(5)
            mob = mob - damage
            puts "The Boss -#{damage}hp"
            puts "=_+"
            puts " |---"
            puts "/|"
            puts "HP: #{mob}"
        else
            puts "You escaped the battle!"
        end
    end
    puts "Cangratulations! You killed the mob!"
    $exp += 10
    level($exp)
    showstat()
    $killedmob += 1
    if($killedmob == 5)
        puts "The boss!"
        puts "Accept the battle? Yes/No"
        accept = gets.chomp
        if(accept.downcase == "yes")
            CreateABoss()
        else
            puts "You escaped the battle!"
        end
    end
    start()
end


def start()
    puts "Create a battle? Yes/No"
    start = gets.chomp
    if(start.downcase == "yes")
        CreateAMob()
    end
end
start()