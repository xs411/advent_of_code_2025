##
# Takes a filename consisting of a series of turn instructions ex: L5, R2
# and calculates how many times a theoretical combination lock lands on 0 OR
# passes 0
#
def crack_the_code(filename)
  lock = CombinationLock.new
  zero_count = 0
  File.foreach(filename) do |line|
    direction = line[0]
    amount = line[1..-1].to_i
    position = lock.turn(direction, amount)
    puts "Position: #{position}"
    if position == 0
      zero_count += 1 
    end
    puts line
  end
  puts "The code is #{zero_count}"
end

class CombinationLock
  def initialize(position = 50, modulo = 100)
    @position = position
    @modulo = modulo
  end

  def turn(direction, amount)
    if direction == 'L'
      @position = (@position - amount) % @modulo
    elsif direction == 'R'
      @position = (@position + amount) % @modulo
    end
    @position
  end

end


crack_the_code(ARGV[0]) 