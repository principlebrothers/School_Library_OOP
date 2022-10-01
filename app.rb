require_relative 'person'
require_relative 'rental'
require_relative 'book'
require_relative 'student'
require_relative 'teacher'
require_relative 'classroom'
require 'date'

class App
  attr_reader :books, :people, :rentals

  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  # list all books
  def list_books
    if @books.length.positive?
      @books.each { |book, index| puts "#{index}. Title: #{book.title}, Author: #{book.author}" }
    else
      puts 'No book available yet'
    end
  end

  # list all people
  def list_people
    if @people.length.positive?
      @people.each do |person|
        puts "[#{person.class}] Name: #{person.name}, Age: #{person.age} years, ID: #{person.id}"
      end
    else
      puts 'No person added yet'
    end
  end

  # create a person
  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    person_type = gets.chomp

    if person_type != '1' && person_type != '2'
      puts 'Invalid option'
      return
    end

    case person_type
    when '1'
      create_student
    when '2'
      create_teacher
    end
  end

  # create student
  def create_student
    print 'Name: '
    name = gets.chomp

    print 'Age: '
    age = gets.chomp.to_i

    print 'Do you have parent permission? [Y/N]: '
    parent_permission = gets.chomp.downcase == 'y'

    print 'What is the student\'s classroom?: '
    classroom_label = gets.chomp
    classroom = Classroom.new(classroom_label)

    @people << Student.new(classroom, age, name, parent_permission: parent_permission)
    puts '*** Student created successfully ***'
  end

  # create teacher
  def create_teacher
    print 'Name: '
    name = gets.chomp

    print 'Age: '
    age = gets.chomp.to_i

    print 'Specialization: '
    specialization = gets.chomp

    @people << Teacher.new(specialization, age, name)
    puts '*** Person created successfully ***'
  end

  # create a book
  def create_book
    print 'Title: '
    title = gets.chomp

    print 'Author: '
    author = gets.chomp

    @books << Book.new(title, author)
    puts '*** Book created successfully ***'
  end

  # create a rental
  def create_rental
    if @books.length.positive? && @people.length.positive?
      @books.each_with_index { |book, index| puts "#{index}). Title: '#{book.title}' by Author: #{book.author}" }
      puts 'Select a book from the list above by number'

      book_index = gets.chomp.to_i

      @people.each_with_index do |person, index|
        puts "#{index}. [#{person.class}] Name: #{person.name}, ID: #{person.id}"
      end
      puts ' '
      puts 'Select a person from the list by number on your left (not ID)'
      print 'number: '

      person_index = gets.chomp.to_i

      date = Date.today

      @rentals << Rental.new(date, @books[book_index], @people[person_index])
      puts '*** Rental created successfully ***'
    else
      puts 'There are no books or persons to create a rental'
    end
  end

  # list all rentals for a given person by id
  def list_rentals_for_person_id
    print 'ID of person: '
    person_id = gets.chomp.to_i

    rentals = @rentals.filter { |rental| rental.person.id == person_id }
    if rentals.length >= 1
      puts 'Rentals:'
      rentals.each do |rental|
        puts "Date: #{rental.date}, Book: \"#{rental.book.title}\" by #{rental.book.author}"
      end
    else
      puts 'No rentals found for that ID'
    end
  end
end
