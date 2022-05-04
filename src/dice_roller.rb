class DiceRoller
  def self.roll_from_table(array_of_possible_things)
    thing_index = roll_dice(array_of_possible_things.count) - 1
    array_of_possible_things[thing_index]
  end

  def self.roll_dice(number_of_sides)
    rand(1..number_of_sides)
  end
end