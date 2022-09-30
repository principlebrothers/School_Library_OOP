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

  
end