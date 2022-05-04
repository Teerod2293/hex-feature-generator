class WeatherGenerator
  require_relative 'src/dice_roller'

  def self.generate
    generate_weather
  end

  private

  def self.generate_weather
    weather_is_strange = DiceRoller.roll_dice(6) == 6
    base = DiceRoller.roll_from_table(base_weather_table)
    extra = DiceRoller.roll_from_table(extra_weather_table)
    reaction = DiceRoller.roll_from_table(reaction_to_weather_table)
    strange_effect = (DiceRoller.roll_from_table(strange_effect_to_weather_table) if weather_is_strange)

    "Погода #{base}, #{extra}\n#{reaction}\n#{strange_effect}"
  end

  def self.base_weather_table
    table = []
    10.times { table << "сухая" }
    10.times { table << "влажная" }
    10.times { table << "жаркая" }
    10.times { table << "холодная" }
    10.times { table << "прохладная" }
    10.times { table << "теплая" }
    5.times { table << "моросящая" }
    5.times { table << "ветренная" }
    5.times { table << "пыльная" }
    5.times { table << "дождливая" }
    3.times { table << "очень жаркая" }
    3.times { table << "очень холодная" }
    1.times { table << "ураган" }
    1.times { table << "гроза" }
    1.times { table << "буря" }
    table
  end

  def self.extra_weather_table
    table = []
    1.times { table << "солнце не уходит с зенита" }
    1.times { table << "странный запах" }
    1.times { table << "грязь липнет к ногам" }
    1.times { table << "комары постоянно жужжат над ухом" }
    1.times { table << "солнце ослепляет" }
    1.times { table << "от ветра деревья приятно шуршат" }
    1.times { table << "пыль постоянно забивается в обувь" }
    1.times { table << "кожа быстро пересыхает" }
    1.times { table << "листья высохли и хрустят под ногами" }
    1.times { table << "ветер вечно дует в лицо" }
    table
  end

  def self.reaction_to_weather_table
    table = []
    1.times { table << "Местные спокойно относятся к погоде" }
    1.times { table << "Местным нравятся погода" }
    1.times { table << "Местные привыкли к погоде" }
    1.times { table << "Местные гордятся погодой будто это результат их ритуалов" }
    1.times { table << "Местные ненавидят погоду" }
    1.times { table << "Местные прячутся от погоды" }
    1.times { table << "Местные верят что погоду напустили монстры" }
    1.times { table << "Местные любят эту погоду" }
    1.times { table << "Местные ведут себя странно из-за погоды" }
    table
  end

  def self.strange_effect_to_weather_table
    table = []
    1.times { table << "Из-за погоды монстры выбираются из своих убежищ" }
    1.times { table << "Из-за погоды монстры прячутся" }
    1.times { table << "Из-за погоды элементали явнее себя проявляют" }
    1.times { table << "Из-за погоды умирают растения" }
    1.times { table << "Из-за погоды растения цветут" }
    1.times { table << "Из-за погоды здания рушатся" }
    1.times { table << "Из-за погоды рыба всплывает брюхом вверх" }
    1.times { table << "Из-за погоды животные сбиваются в стаи" }
    1.times { table << "Из-за погоды животные ведут себя напряженно" }
    1.times { table << "Из-за погоды животные исчезают" }
    1.times { table << "Из-за погоды птицы поют сильнее чем обычно" }
    1.times { table << "Из-за погоды солнце не встает" }
    1.times { table << "Из-за погоды солнце не заходит" }
    1.times { table << "Из-за погоды призраки гуляют по улицам" }
    1.times { table << "Из-за погоды еда портится" }
    1.times { table << "Из-за погоды кажется будто кто то в далеке шепчет что то" }
    1.times { table << "Из-за погоды кажется будто кто то в далеке поет что то" }
    table
  end
end
