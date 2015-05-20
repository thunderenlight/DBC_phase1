#notes: review roman for % use, review battleship
def factorial_iterative(n)
  (2 .. n - 1).each {|i| n *= i}
  n
end
p factorial_iterative(5)
def f(n)
	n.zero? ? 1: n * f(n-1)
end
p f(8)

def fibonacci_recursive(num)
#unless num <= 1 num -1 + num = new num
  ary = [0,1]
    until (ary.length -1) >= num
    ary << (ary[-1] + ary[-2])
  end
  ary[n]
end
def fib(n)
	return n if n < 2
	fib(n - 1) + fib(n - 2 )

end
def prime(n)
	for i in 2 ..(n - 1)
	 if (n % i) == 0
	 	return false
	 end
	end
	 true
end


require 'debugger'

# An array of primes
# -- Prime:
        # => Is divisible only by 1 and itself
# -- To determine prime:
        # => Test from 1 to (n / 2)

# Requirement:
# No duplicates in array of primes


def prime_factors(number)
  primes = []
  return primes unless number >= 1
  return primes << number if is_prime?(number)
  # until is_prime?(number) do
    (2..(number / 2)).to_a.each do |num|
      if number % num == 0  # Divisor
        if is_prime?(num)
          primes << num
          number /= num
          return (primes << prime_factors(number)).flatten
          # break
        end
      end
    end
  # end
  # primes << number
end

def is_prime?(number)
  (2..(number / 2)).to_a.each do |num|
    if number % num == 0
      return false
    end
  end
  true
end


# puts is_prime?(3) == true
# puts is_prime?(41) == true

p prime_factors(0)          == []
p prime_factors(3)          == [3]
p prime_factors(6)            == [2,3]
p prime_factors(8)          == [2,2,2] # => 2 [=> 4 => [2, 2]]
p prime_factors(25)         == [5,5]
p prime_factors(123123123)  == [3, 3, 41, 333667]

