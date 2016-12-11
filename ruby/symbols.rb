# this is a symbol
:pedro

puts :pedro
puts :pedro.to_s
puts :pedro.class
puts :pedro.object_id

# arrays
array0 = Array.new
# array with starting size and nil objects
array1 = Array.new(5)
# array with starting size and pre-defined objects
array2 = Array.new(5, "empty")
array3 = [1, 2.3, "dog"]

arrays = [array0, array1, array2, array3]

for array in arrays
  puts "this is a new array"
  p array
end

puts array3[1,2].join(", ")
p array3.values_at(0,2).join(", ")

array3.unshift(0)
p array3
array3.shift
p array3

array3.push(100,200)
p array3
array3.pop
p array3

array3.concat([10, 20, 30])
p array3

puts "Array size: #{array3.size()}"
puts "Array include: #{array3.include?"dog"}"
puts "Array how many: #{array3.count("dog")}"
puts "Array empty: #{array3.empty?}"

puts array3.join(", ")
p array3 # cooler way of printing arrays
# puts array3

# hashes
number_hash = {
  "PI" => 3.14,
  "Golden" => 1.618,
  "e" => 2.718
}

puts "PI = #{number_hash["PI"]}"

# setting default value for keys
sampl_hash = Hash.new("No such key")
puts sampl_hash["dog"].to_s
sampl_hash["dog"] = "bili"
puts sampl_hash["dog"].to_s

number_hash.each do |key, value|
  puts "#{key}: #{value}"
end

# the "pythonic way"
for key, value in number_hash
  puts "#{key}: #{value}"
end

# enumerables (enum)
class Menu
  include Enumerable
  def each
    yield "pizza"
    yield "spaghetti"
    yield "salad"
    yield "water"
  end
end

menu = Menu.new

menu.each do |item|
  puts "would you like a #{item}"
end

p menu.find{ |item| item = "pizza" }
p menu.select{ |item| item.size <= 5 }
p menu.reject{ |item| item.size <= 5 }
p menu.first
p menu.take(2)
p menu.drop(2)
p menu.min
p menu.max
p menu.sort
menu.reverse_each{ |item| puts item }

