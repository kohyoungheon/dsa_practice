class MedianFinder
  attr_accessor :small, :large
  def initialize()
    @small = Containers::MaxHeap.new
    @large = Containers::MinHeap.new
  end

  def add_num(num)
    if @small.length == @large.length
      @small.push(num)
      @large.push(@small.pop())
    else
      @large.push(num)
      @small.push(@large.pop())
    end
  end

  def find_median()
    if @small.length == @large.length
      return (@small.max + @large.min) / 2.0
    else
      return @large.min
    end
  end  
end