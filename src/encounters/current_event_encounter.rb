class CurrentEventEncounter < Encounter
  
  private
  
  def table
    table = []
    1.times { table << "Fire covering 1d6 (50% yards or 50% miles) $" }
    7.times { table << "1d2 animals attacking woman & child (commoners)" }
    10.times { table << "Robbers attacking 1d2 travellers" }
    10.times { table << "Monsters attacking 1d2 travellers" }
    10.times { table << "Animal munching on dead body" }
    35.times { table << "Minor Event:" }
    5.times { table << "Flying Monster Overhead with a dead body in its in mouth" }
    5.times { table << "Mage Duel - two Spell Casters attacking each other" }
    5.times { table << "1d3 + 4 cultists around a naked humanoid tied to an Altar" }
    9.times { table << "Prisoner being chased by 1d2 + 2 guards" }
    3.times { table << "1d3 + 2 thugs digging up Buried Treasure" }
    table
  end
end