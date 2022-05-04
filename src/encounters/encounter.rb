class Encounter
  def self.call
    self.new.get_proc
  end

  def get_proc
    Proc.new{ DiceRoller.roll_from_table(table) }
  end
end