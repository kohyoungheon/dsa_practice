class TrieNode
  attr_accessor :children, :is_end
  def initialize
    @children = {}
    @is_end = false
  end
end

class Trie
  attr_accessor :root

  def initialize
    @root = TrieNode.new
  end

  def insert(word)
    current = @root
    word.each_char do |char|
      current.children[char] = TrieNode.new unless current.children[char]
      current = current.children[char]
    end
    current.is_end = true
  end

  def search(word)
    current = @root
    word.each_char do |char|
      return false unless current.children[char]
      current = current.children[char]
    end
    current.is_end
  end

  def starts_with(prefix)
    current = @root
    prefix.each_char do |char|
      return false unless current.children[char]
      current = current.children[char]
    end
    return true
  end
end