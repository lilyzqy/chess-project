# PHASE 2
def convert_to_int(str)
  begin
  Integer(str)

rescue ArgumentError
  puts "It cannot convert into integer.Please enter a number."
end
end

# PHASE 3
FRUITS = ["apple", "banana", "orange"]
def reaction(maybe_fruit)

  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  else
    raise StandardError
  end
end

def feed_me_a_fruit
  begin
    puts "Hello, I am a friendly monster. :)"

    puts "Feed me a fruit! (Enter the name of a fruit:)"
    maybe_fruit = gets.chomp
    reaction(maybe_fruit)
  rescue StandardError
    puts "Not a fruit"
  retry
  end
end


# PHASE 4
class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    raise ArgumentError.new("Name was empty") if name.empty?
    @name = name
    raise ArgumentError.new("Years less than 5 is not a beatfriend") if yrs_known < 5
    @yrs_known = yrs_known
    raise ArgumentError.new("favorite pasttime was empty") if fav_pastime.empty?
    @fav_pastime = fav_pastime
  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me."
  end
end
sam = BestFriend.new('cc', 1, 'ss')

sam.talk_about_friendship
sam.do_friendstuff
sam.give_friendship_bracelet
