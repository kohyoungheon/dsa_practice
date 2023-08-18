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
    true
  end
end
#____________________________________________________--

class WordDictionary
  def initialize
    @root = TrieNode.new
  end

  def add_word(word)
    current = @root
    word.each_char do |char|
      current.children[char] = TrieNode.new unless current.children[char]
      current = current.children[char]
    end
    current.is_end = true
  end

  def search(word)
    dfs(0, word, @root)
  end

  private

  def dfs(j, word, current)
    return true if j == word.length && current.is_end

    return false if j >= word.length

    char = word[j]
    if char == '.'
      current.children.values.each do |child|
        return true if dfs(j + 1, word, child)
      end
    else
      return false unless current.children[char]
      return dfs(j + 1, word, current.children[char])
    end

    false
  end

end

