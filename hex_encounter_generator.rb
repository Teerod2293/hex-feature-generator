class HexEncounterGenerator
  require_relative 'src/libraries'

  def self.generate(explored: false)
    return 'Ничего не произошло' if DiceRoller.roll_dice(3) != 3
    feature = DiceRoller.roll_from_table(selected_table(explored))
    feature.is_a?(String) ? feature : feature.call
  end

  private

  def self.selected_table(explored)
    explored ? explored_hex_table : non_explored_hex_table
  end

  def self.non_explored_hex_table
    table = []
    9.times { table << NpcEncounter.call }
    10.times { table << AnimalHerdEncounter.call }
    20.times { table << WanderingMonsterEncounter.call }
    5.times { table << LairEncounter.call }
    10.times { table << RemoteStructureEncounter.call }
    15.times { table << RuinedStructureEncounter.call }
    9.times { table << PastEventEncounter.call }
    10.times { table << CurrentEventEncounter.call }
    1.times { table << LostItemEncounter.call }
    8.times { table << NaturalStructureEncounter.call }
    3.times { table << RemarkableFeatureEncounter.call }
    table
  end

  def self.explored_hex_table
    table = []
    15.times { table << NpcEncounter.call }
    15.times { table << AnimalHerdEncounter.call }
    36.times { table << WanderingMonsterEncounter.call }
    15.times { table << PastEventEncounter.call }
    15.times { table << CurrentEventEncounter.call }
    1.times { table << LostItemEncounter.call }
    3.times { table << RemarkableFeatureEncounter.call }
    table
  end
end
