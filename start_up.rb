require_relative 'app'

class StartUp
  def initialize
    @app = App.new
    @option = 0
  end

    def menu_options
    puts ' '
    puts ' *** WELCOME TO THE GATE SCHOOL LIBRARY APP! *** '
    puts '-------------------------------------------------'
    puts ' '

    while @option != 7
      puts 'Please choose an option from the menu below by entering a number: '
      puts '1 - List all books'
      puts '2 - List all people'
      puts '3 - Create a person'
      puts '4 - Create a book'
      puts '5 - Create a rental'
      puts '6 - List all rentals for a given person id'
      puts '7 - Exit'
      puts ' ----------------------------------------------------- '
      puts ' '
      start_app
    end
  end

  def start_app
    print 'option: '
    @option = gets.chomp.to_i
    case @option
    when 1
      @app.list_books
    when 2
      @app.list_people
    when 3
      @app.create_person
    when 4
      @app.create_book
    when 5
      @app.create_rental
    when 6
      @app.list_rentals_for_person_id
    end
  end
end