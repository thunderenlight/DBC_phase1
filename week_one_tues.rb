W

def pig_latin
gets.chomp.gsub(/\b([^aeiou ]+)([aeiou]\w*)/,'\2\1ay').downcase.capitalize
end



def print_odd_indexed_integers(array)
array.each_with_index do |value, index|
puts value if index.even?
end
end
# TODO: Return the odd numbers from a list of integers.
# You should make use of Enumerable#select
def odd_integers(array)
array.select { |num| num.odd? }
end
def sorted_triples(array)
result = []
array.each_slice(3) { |a| result << a.sort }
result
end

http://www.tutorialspoint.com/ruby/ruby_regular_expressions.htm
def destroy_message!(string)
string.include?(":") ? string.gsub!(/:.*/,":") : nil
end
# Driver code...
string = "this message will self-destruct: you can't hug every cat"
original_string = string.dup
puts destroy_message(string) == "this message will self-destruct:"
puts string == original_string # we shouldn't modify the string passed to destroy_message

#reflection on Monday : importance of scope and side effects of 
