require_relative 'start_up'

class Main
  def initialize
    start = StartUp.new
    start.menu_options
  end

  def end_app
    puts ' '
    puts 'Thank you for using The Gate School Library App!'
    puts ' '
  end
end

main = Main.new
main.end_app
