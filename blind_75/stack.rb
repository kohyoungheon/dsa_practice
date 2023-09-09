# time complexity of the provided code is O(n), and the space complexity is O(n).
def is_valid(s)
  return true if s.empty?
  
  stack = []
  s.each_char do |c|
      case c
      when '(', '{', '['
          stack.push(c)
      when ')'
          return false unless stack.pop == '('
      when '}'
          return false unless stack.pop == '{'
      when ']'
          return false unless stack.pop == '['
      end
  end
  return stack.empty?
end

#__________________________________________________
class MinStack
    def initialize
      @stack = []
      @min_stack = []
    end
  
    def push(val)
      @stack << val
      if @min_stack.empty?
        @min_stack << val
      else
        val = [val, @min_stack[-1]].min
        @min_stack << val
      end
    end
  
    def pop
      @min_stack.pop
      @stack.pop
    end
  
    def top
      @stack[-1]
    end
  
    def get_min
      @min_stack[-1]
    end
  end
end

#_________________________________________________
#evaluate reverse polish notation
def eval_rpn(list)
  stack = []
  list.each do |char|
    if char == "+"
      stack.append(stack.pop + stack.pop)
    elsif char == "-"
      stack.pop = a
      stack.pop = b
      stack.append(b-a)
    elsif char == '*'
      stack.append(stack.pop * stack.pop)
    elsif char == '/'
      stack.pop = a
      stack.pop = b
      stack.append((b.to_f/a).to_i)
    else
      stack << char.to_i
    end
  end
  return stack[0]
end
#__________________________________________
#generate parentheses
def generate_parenthesis(n)
  @stack = []
  @res = []
  @n = n

  def backtrack(open_n, closed_n)
    if open_n == closed_n && open_n == @n
      @res.push(@stack.join(''))
      return
    end

    if open_n < @n
      @stack.push('(')
      backtrack(open_n + 1, closed_n)
      @stack.pop
    end
    if closed_n < open_n
      @stack.push(')')
      backtrack(open_n, closed_n + 1)
      @stack.pop
    end
  end

  backtrack(0, 0)
  @res
end
#______________________________________________
# Input: temperatures = [73,74,75,71,69,72,76,73]
# Output: [1,1,4,2,1,1,0,0]
#How many days til it gets hotter?
def daily_temperatures(temperatures)
  res = Array.new(temperatures.length, 0)
  stack = []  # pair: [temp, index]

  temperatures.each_with_index do |t, i|
    while !stack.empty? && t > stack[-1][0]
      stack_temp, stack_index = stack.pop
      res[stack_index] = i - stack_index
    end
    stack.push([t, i])
  end

  res
end