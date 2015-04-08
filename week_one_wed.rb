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
