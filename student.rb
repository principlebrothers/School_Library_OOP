require_relative 'person'

class Student < Person
  attr_accessor :classroom

  def initialize
    super(age, name, parent_permission)
    @classroom = classroom
    add_to_class(classroom)
  end

  def add_student(classroom)
    classroom.add_student(self)
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
