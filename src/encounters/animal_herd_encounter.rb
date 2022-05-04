class AnimalHerdEncounter < Encounter
  
    private
  
    def table
      table = []
      8.times { table << "4d4 wolves" }
      10.times { table << "3d4 boars" }
      5.times { table << "3d4 axe beaks" }
      22.times { table << "5d4 deer" }
      14.times { table << "4d4 wild horses" }
      20.times { table << "5d4 elk" }
      10.times { table << "5d3 hyena" }
      10.times { table << "5d3 jackal" }
      1.times { table << "4d3 elephants" }
      table
    end
  end