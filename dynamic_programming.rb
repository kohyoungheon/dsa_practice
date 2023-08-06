# Fib(0) = 0
# Fib(1) = 1
# Fib(n) = Fib(n-1) + Fib(n-2) for n > 1
#Iterative
def fib(n)
  a = 0
  b = 1

  n.times do
    temp = a
    a = b
    b = temp + b
  end

  return a
end
#Recursive
def fib_r(n)
  return fib_r_helper(n, {})
end

def fib_r_helper(n, memo)
  return memo[n] if memo.include?(n)
  return 0 if n == 0
  return 1 if n == 1

  memo[n] = fib_r_helper(n - 1, memo) + fib_r_helper(n - 2, memo)
  return memo[n]
end
