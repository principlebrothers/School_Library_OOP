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


end