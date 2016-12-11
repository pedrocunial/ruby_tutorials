# comment
print "Enter a value: "
first_num = gets.to_i

print "Enter another value: "
second_num = gets.to_i

puts first_num.to_s + " + " + second_num.to_s + " = " +
     (first_num + second_num).to_s

# float precision - basically 'til the 14th case
# also, float sucks
num_one = 1.000
num_99 = 0.999

puts num_one.to_s + " - " + num_99.to_s + " = " +
     (num_one - num_99).to_s

# getting the type of a variable
# NOTE: Integers are called Fixnums
puts 1.class
puts 1.234.class
puts "String!".class

# constants
# the constant will change, but it'll show us a warning
# (kinda like a runtime exception)
A_CONSTANT = 31.4
puts A_CONSTANT
A_CONSTANT = 1.6
puts A_CONSTANT

# io
write_handler = File.new("yourSum.out", "w")
write_handler.puts("Random text").to_s
write_handler.close

data_from_file = File.read("yourSum.out")
puts "Data from file: " + data_from_file.to_s

load "second.rb"

=begin
multiline comments
=end

print "Enter your age: "
age = gets.to_i

# conditionals
# comparison: == != > < <= >=
# logical: && || ! and or not
if (age >= 5) && (age <=6)
  puts "You are in kindengarden"
elsif (age >= 7) && (age <= 13)
  puts "You are in middle school"
else
  puts "You are a real man, fuck you"
end

puts "true && false = " + (true && false).to_s
puts "true || false = " + (true || false).to_s
puts "!false = " + (!false).to_s
puts "true and false = " + (true and false).to_s
puts "true or false = " + (true or false).to_s
puts "not false = " + (not false).to_s

# special condition: <=>
# returns a positive number if the first one is greater
# than the second one, or a negative if the second is
# greater
puts "5 <=> 10 = " + (5 <=> 10).to_s
puts "10 <=> 5 = " + (10 <=> 5).to_s

# hard as fk to read
unless age > 4
  puts "No school"
else
  puts "Go to school"
end

# conditions to output
puts "You are young" if age < 30

# switch case, or case when...
print "Enter your nationality: "
greeting = gets.chomp  # chomp breaks the newline character

case greeting
when "French", "french"
  puts "bonjour"
  exit
when "Spanish", "spanish"
  puts "hola"
  exit
when "Brazilian", "brazilian"
  puts "oi"
  exit
else "English" # the value is unnecessary
  puts "Hello"
end
puts greeting

# oneliners
puts (age >= 50) ? "old" : "young"

# loops
x = 1
# do while (?)
loop do
  x += 1
  next unless (x % 2) == 0
  # if the number is even we'll print it, else
  # we'll be on the next iteration of the loop already
  puts x
  break if x >= 10
end

# while -- it doesn't require a break statement
y = 1
while y <= 10
  y += 1
  next unless (y % 2) == 0
  puts y
end

# until -- a "reverse logic" while
a = 1
until a >= 10
  a += 1
  next unless (a % 2) == 0
  puts a
end

numbers = [1, 2, 3, 4, 5]
for number in numbers
  puts "#{number}"
end

groceries = ["banana", "apple", "olive", "lemonade"]
groceries.each do |food|
  puts "get some #{food}"
end

# iterating through a range
(0..5).each do |i|
  puts "#{i}"
end

# "pythonic" loop
for i in (0..5)
  puts "i = #{i}"
end

# functions!
def add_nums(num_1, num_2)
  return num_1.to_i + num_2.to_i
end

puts add_nums(3,2)

# args are always passed by VALUE!
x = 1
def change_x(x)
  x = 4
  puts "i'm inside and x = #{x}"
end

change_x(x)
puts "i'm outside and x = #{x}"

# EXCEPTIONS!
print "Enter a number: "
first = gets.to_i
print "Second number: "
second = gets.to_i
# try-catch
begin
  answer = first / second
rescue
  puts "You cant divide by zero, dumbass"
end

puts "#{first} / #{second} = #{answer}"

# throws
age = 22
def check_age(age)
  raise ArgumentError, "Enter positive number" unless age > 0
end

begin
  check_age(-1)
rescue ArgumentError
  puts "That is and impossible age"
end

# strings
# "allows you to 'template'"
# 'does not allow you to "template"'
puts "Add them #{2 + 2}\n\n" # the #{} is called interpolation
puts 'Add them #{2 + 2}\n\n'

# multiline string: here doc
multiline_str = <<EOM
this is a very long string
that contains interpolation
like #{2 + 2} \n
you see?
EOM

puts multiline_str

first_name = "Pedro"
last_name = "Campos"

# concat
full_name = first_name + last_name
middle_name = "Cunial"

# concat
full_name = "#{first_name} #{middle_name} #{last_name}"

# checking
puts full_name.include?("Campos")
puts full_name.size
puts "Vowels: " + full_name.count("aeiou").to_s
puts "Consonants: " + full_name.count("^aeiou").to_s
puts full_name.start_with?("Campos").to_s
puts "Index: " + full_name.index("Campos").to_s
puts "index interpolated: #{full_name.index('Campos')}"

# comparing by value
puts "'A' == 'A' = #{'A' == 'A'}"
# comparing by reference
puts "\"a\".equal?(\"a\"): #{"a".equal?("a")}"

puts full_name.upcase
puts full_name.downcase
puts full_name.swapcase

# strip
full_name = "           " + full_name
puts full_name
full_name = full_name.strip
# you can use lstrip to strip left or rstrip for right
puts full_name

# formating
puts full_name.rjust(30, ".")
puts full_name.ljust(30, ".")
puts full_name.center(30, ".")

puts full_name.delete("o")

name_array = full_name.split(//)
puts name_array
name_array = full_name.split(/ /)
puts name_array

# CLASSES
class Animal
  def initialize
    puts "Creating new animal"
  end

  def set_name(new_name)
    @name = new_name
  end

  def get_name
    @name
  end

  def name
    @name
  end

  def name=(new_name)
    if new_name.is_a?(Numeric)
      puts "Name can't be a number"
    else
      @name = new_name
    end
  end
end

cat = Animal.new
cat.set_name("dogo")
puts cat.get_name
puts cat.name
cat.name = "bili"
puts cat.name

class Dog
  # # generate getters
  # attr_reader :name, :height, :weight
  # # generate setters
  # attr_writer :name, :height, :weight
  # generate both
  attr_accessor :name, :height, :weight

  def bark
    return "Generic bark"
  end
end

dogo = Dog.new
dogo.name = "dogo"
puts dogo.name

class GermanShepard < Dog
  # inheritance
  def bark
    return "Loud bark!"
  end
end

max = GermanShepard.new
max.name = "max"
printf "%s goes %s\n", max.name, max.bark

