require_relative 'person'
require_relative 'rental'
require_relative 'book'
require_relative 'student'
require_relative 'teacher'
require_relative 'classroom'

class App
  attr_reader :books, :people, :rentals

  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  # list all books
  def list_books
    @books.each { |book| puts book }
  end

  # list all people
  def list_people
    @people.each { |person| puts person }
  end

  # create a person
  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    person_type = gets.chomp

    if person_type != '1' && person_type != '2'
      puts 'Invalid option'
      return
    end

    print 'Name: '
    name = gets.chomp

    print 'Age: '
    age = gets.chomp.to_i

    case person_type
    when '1'
      print 'Do you have parent permission? [Y/N]: '
      parent_permission = gets.chomp.downcase == 'y'
      case parent_permission
      when 'y'
        parent_permission = true
      when 'n'
        parent_permission = false
      else
        puts 'Invalid input. Please enter "y" or "n"'
        return
      end

      @people << Student.new(age, name, parent_permission: parent_permission)
      puts 'Person created successfully'
    when '2'
      print 'Specialization: '
      specialization = gets.chomp

      @people << Teacher.new(age, name, specialization,)
      puts 'Person created successfully'
    end
  end

  # create a book
  def create_book
    print 'Title: '
    title = gets.chomp

    print 'Author: '
    author = gets.chomp

    @books << Book.new(title, author)
    puts 'Book created successfully'
  end

  # create a rental
  def create_rental
    if @books.length.positive? && @persons.length.positive?
      puts 'Select a book from the following list by number'
      @books.each_with_index { |book, index| puts "#{index}) #{book}" }

      book_index = gets.chomp.to_i

      puts 'Select a person from the following list by number (not id)'
      @persons.each_with_index { |person, index| puts "#{index}) #{person}" }

      person_index = gets.chomp.to_i

      print 'Date (yyyy-mm-dd): '
      date = gets.chomp

      @rentals << Rental.new(date, @books[book_index], @persons[person_index])
      puts 'Rental created successfully'
    else
      puts 'There are no books or persons to create a rental'
    end
  end

  # list all rentals for a given person by id
  def list_rentals_for_person_id
    print 'ID of person: '
    id = gets.chomp.to_i

    rental = @rentals.each { |rental| person.id == id }
    if rental.length >= 1
      puts 'Rentals:'
      rental.each { |rental| puts "#{index}. Date: #{rental.date}, Book: \"#{rental.book.title}\" by #{rental.book.author}" }
    else
      puts 'No rentals found for that ID'
    end
  end

  def start
    puts 'Welcome to School Library App!'
end