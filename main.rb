require_relative 'hex_encounter_generator'
require_relative 'weather_generator'
require_relative 'calendar_day_tracker'
require 'io/console'
require 'optparse'
require 'date'

input = ''
OptionParser.new do |opts|
  opts.on('-d [ARG]', '--date [ARG]') do |date|
    @arg_date = Date.parse(date)
  end
  opts.on('-t [ARG]', '--time-of-day [ARG]') do |time_of_day|
    raise "Не верное время дня #{time_of_day}, должно быть одно из #{CalendarDayTracker.times_of_day}" unless CalendarDayTracker.times_of_day.include?(time_of_day)
    @arg_time_of_day = time_of_day
  end
end.parse!

def last_date_from_log
  return unless File.file?('log.txt')
  possible_line_with_date = IO.readlines('log.txt')[-12]
  separated_line = possible_line_with_date.split(' | ')
  possible_date = separated_line.first.strip
  Date.parse(possible_date) if possible_date
end

def next_time_of_day
  @arg_time_of_day || 'День'
end

def next_date
  @arg_date || (last_date_from_log.next if last_date_from_log) || Date.today
end

@options = {
  explored: false,
  next_time_of_day: next_time_of_day,
  next_date: next_date,
}

def clear_screen
  print "\e[H\e[2J"
end

def parse_input
  input = STDIN.getch
  exit if input == 'q'
  @options[:explored] = !@options[:explored] if input == 'e'
  @options[:next_time_of_day] = CalendarDayTracker.next_time_of_day(@options[:next_time_of_day]) if input == 'n'
  @options[:next_date] = @options[:next_date].next if input == 'd'
  @options[:next_date] = @options[:next_date].prev_day if input == 'p'
  input
end

def output
  output_string = <<-HEREDOC
#{ '-' * 29 + 'КАЛЕНДАРЬ' + '-' * 28 }
#{ CalendarDayTracker.call(next_time_of_day: @options[:next_time_of_day], next_date: @options[:next_date]) }
#{ '-' * 30 + 'ПОГОДА' + '-' * 30 }
#{ WeatherGenerator.generate }
#{ '-' * 30 + 'СОБЫТИЕ' + '-' * 29 }
#{ @options[:explored] ? 'Иследованый гекс' : 'Не иследованый гекс' }
#{ HexEncounterGenerator.generate(explored: @options[:explored]) }
#{ '-' * 66 }
  HEREDOC
end

def log(string)
  File.open("log.txt", 'a') {|f| f.write(string) }
end

def date_from_log
  IO.readlines("log.txt")[-25..-1]
end

def options_output
  <<-HEREDOC
  Дата: #{@options[:next_date]}
  Время дня: #{@options[:next_time_of_day]}
  Гекс исследован?: #{@options[:explored]}
  HEREDOC
end

while true do
  clear_screen
  if input == 'g' || @output_string.nil?
    @output_string = output
    log(@output_string)
  end
  puts @output_string
  puts '-' * 19 + 'НАСТРОЙКИ СЛЕДУЮЩЕЙ ГЕНЕРАЦИИ' + '-' * 18
  puts options_output
  puts '-' * 28 + 'УПРАВЛЕНИЕ' + '-' * 28
  puts "q - Выход | g - Сгенерировать"
  puts "e - Иследованый\\Не иследованый гекс"
  puts "n - Следующее время дня"
  puts "d - Следующий день | p - Предыдущий день"
  input = parse_input
  
end