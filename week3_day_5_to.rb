require_relative 'config/application'
require_relative 'app/models/task.rb'
require_relative 'app/models/list'

# puts "Put your application code in #{File.expand_path(__FILE__)}"

class ToDo

  def add(new_task)
    Task.create!()
  end


  def list
   List.all
  end


  def delete(id)
    List.task(id).destroy
  end


  def completed(id)
    Task.complete(id)
    #its still a string and need to just add "complete"
  end
  # setting a var to a hash that makes the key a command call
  commands = Hash.new { |hash, key| hash[key] = "#{key}" }

  # when i run this program, if there's an arg passed
  if ARGV.any?
    # create a new list (WHY??)
    list = List.new
    # take the arg after command and name it command
    command = ARGV.shift
    # whatever the word is
    case command
      # when the command is list
    when "list"
      # return a the list of tasks
      puts list.tasks
    when "delete", "complete", "add"
      list.send(commands[command], ARGV.join(" "))
      puts List.tasks
    end
  end
end


////********************************SEEEEEDS*******************************************\\\

require 'faker'

Task.create([
{ name:         Faker::Lorem.words,
  description:  Faker::Lorem.words(3) },
{ name:         Faker::Lorem.words,
  description:  Faker::Lorem.words(3) }
])

# Seed lists table
List.create([
  {name: "Business", description: "work related" },
  {name: "Family", description: "home related" },
])


# Seed people table
User.create([
  {first_name: "Teagan",  last_name: "Hickman" },
  {first_name: "Taylor",  last_name: "Long-Hurst" },
  {first_name: "Aaron",   last_name: "Cumbow" },
  {first_name: "Joseph",  last_name: "Leal" },
  {first_name: "Susan",   last_name: "Spallino" },
])

# 3.times do
#   Task.create(name: Faker::Lorem.words,
#               description: Faker::Lorem.words(3) )
# end

