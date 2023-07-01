require './4. graphs.rb'
require 'rspec'

describe "graphs" do

  describe "depth first print" do
    it "test case 1" do
      graph = {
        "a" => ["b", "c"],
        "b" => ["d"],
        "c" => ["e"],
        "d" => ["f"],
        "e" => [],
        "f" => []
      }

      expect { depth_first_print(graph, "a") }.to output("a\nc\ne\nb\nd\nf\n").to_stdout
    end
  end

  describe "depth first print recursive" do
    it "test case 1" do
      graph = {
        "a" => ["b", "c"],
        "b" => ["d"],
        "c" => ["e"],
        "d" => ["f"],
        "e" => [],
        "f" => []
      }

      expect { depth_first_print_rec(graph, "a") }.to output("a\nb\nd\nf\nc\ne\n").to_stdout
    end
  end

  describe "breadth first print" do
    it "test case 1" do
      graph = {
        "a" => ["b", "c"],
        "b" => ["d"],
        "c" => ["e"],
        "d" => ["f"],
        "e" => [],
        "f" => []
      }

      expect { breadth_first_print(graph, "a") }.to output("a\nb\nc\nd\ne\nf\n").to_stdout
    end
  end

  describe "has_path" do
    it "test case 1" do
      graph = {
        'f'=> ['g', 'i'],
        'g'=> ['h'],
        'h'=> [],
        'i'=> ['g', 'k'],
        'j'=> ['i'],
        'k'=> []
      }
      
      # has_path(graph, 'f', 'k') # True
      expect(has_path(graph, 'f', 'k')).to eq(true)
    end

    it "test case 2" do
      graph = {
        'f'=> ['g', 'i'],
        'g'=> ['h'],
        'h'=> [],
        'i'=> ['g', 'k'],
        'j'=> ['i'],
        'k'=> []
      }
      
      # has_path(graph, 'f', 'j') # False
      expect(has_path(graph, 'f', 'j')).to eq(false)
    end

    it "test case 3" do
      graph = {
        'v'=> ['x', 'w'],
        'w'=> [],
        'x'=> [],
        'y'=> ['z'],
        'z'=> [],  
      }
      
      # has_path(graph, 'v', 'w') # True
      expect(has_path_breadth(graph, 'v', 'w')).to eq(true)
    end
  end

  describe "undirected_path" do
    it "test case 1" do
      edges = [
        ['i', 'j'],
        ['k', 'i'],
        ['m', 'k'],
        ['k', 'l'],
        ['o', 'n']
      ]
      
      # undirected_path(edges, 'j', 'm') # -> True
      expect(undirected_path(edges, 'j', 'm')).to eq(true)
    end
    it "test case 2" do
      edges = [
        ['i', 'j'],
        ['k', 'i'],
        ['m', 'k'],
        ['k', 'l'],
        ['o', 'n']
      ]
      
      # undirected_path(edges, 'k', 'o') # -> False
      expect(undirected_path(edges, 'k', 'o')).to eq(false)
    end

    it "test case 3" do
      edges = [
        ['b', 'a'],
        ['c', 'a'],
        ['b', 'c'],
        ['q', 'r'],
        ['q', 's'],
        ['q', 'u'],
        ['q', 't']
      ]
      
      
      undirected_path(edges, 'a', 'b') # -> True
      expect(undirected_path(edges, 'a', 'b')).to eq(true)
    end
  end

  describe "connected components" do
    it "test case 1" do
      hash = {
        3 => [],
        4 => [6],
        6 => [4, 5, 7, 8],
        8 => [6],
        7 => [6],
        5 => [6],
        1 => [2],
        2 => [1]
      }
      expect(connected_components_count(hash)).to eq(3)
    end

    it "test case 2" do
      hash = {
        0 => [8, 1, 5],
        1 => [0],
        5 => [0, 8],
        8 => [0, 5],
        2 => [3, 4],
        3 => [2, 4],
        4 => [3, 2]
      }

      expect(connected_components_count(hash)).to eq(2)
    end
  end

  describe "largest_componenet" do
    it "test case 1" do
      hash = {
        0 => [8, 1, 5],
        1 => [0],
        5 => [0, 8],
        8 => [0, 5],
        2 => [3, 4],
        3 => [2, 4],
        4 => [3, 2]
      } # -> 4

      expect(largest_component(hash)).to eq(4)
    end

    it "test case 2" do
      hash = {
          1 => [2],
          2 => [1,8],
          6 => [7],
          9 => [8],
          7 => [6, 8],
          8 => [9, 7, 2]
        } # -> 4
        expect(largest_component(hash)).to eq(6)
    end
  end

  describe "shortest_path" do
    it "test case 1" do
      edges = [
        ['w', 'x'],
        ['x', 'y'],
        ['z', 'y'],
        ['z', 'v'],
        ['w', 'v']
      ]
      expect(shortest_path(edges, 'w', 'z')).to eq(2)
    end

    it "test case 2" do
      edges = [
        ['w', 'x'],
        ['x', 'y'],
        ['z', 'y'],
        ['z', 'v'],
        ['w', 'v']
      ]

      expect(shortest_path(edges, 'y', 'x')).to eq(1)
    end
    
    it "test case 3" do
      edges = [
        ['m', 'n'],
        ['n', 'o'],
        ['o', 'p'],
        ['p', 'q'],
        ['t', 'o'],
        ['r', 'q'],
        ['r', 's']
      ]
      
      expect(shortest_path(edges, 'm', 's')).to eq(6)
    end
  end

  describe "island count" do
    it "test case 1" do
      grid = [
        ['W', 'L', 'W', 'W', 'W'],
        ['W', 'L', 'W', 'W', 'W'],
        ['W', 'W', 'W', 'L', 'W'],
        ['W', 'W', 'L', 'L', 'W'],
        ['L', 'W', 'W', 'L', 'L'],
        ['L', 'L', 'W', 'W', 'W'],
      ]
      
      expect(island_count(grid)).to eq(3)
    end

    it "test case 2" do 
      grid = [
        ['W', 'L', 'W', 'W', 'W'],
        ['W', 'L', 'W', 'W', 'W'],
        ['W', 'W', 'W', 'L', 'W'],
        ['W', 'W', 'L', 'L', 'W'],
        ['L', 'W', 'W', 'L', 'L'],
        ['L', 'L', 'W', 'W', 'W'],
      ]
      
      expect(island_count(grid)).to eq(3)
    end
  end

  describe "minimum_island" do
    it "test case 1" do
      grid = [
        ['W', 'L', 'W', 'W', 'W'],
        ['W', 'L', 'W', 'W', 'W'],
        ['W', 'W', 'W', 'L', 'W'],
        ['W', 'W', 'L', 'L', 'W'],
        ['L', 'W', 'W', 'L', 'L'],
        ['L', 'L', 'W', 'W', 'W'],
      ]
      
      # minimum_island(grid) # -> 2
      expect(minimum_island(grid)).to eq(2)
    end

    it "test case 2" do
      grid = [
        ['L', 'L', 'L'],
        ['L', 'L', 'L'],
        ['L', 'L', 'L'],
      ]
      
      # minimum_island(grid) # -> 9
      expect(minimum_island(grid)).to eq(9)
    end
  end

  describe "closest_carrot" do
    it "test case 1" do
      grid = [
        ['O', 'O', 'X', 'X', 'X'],
        ['O', 'X', 'X', 'X', 'C'],
        ['O', 'X', 'O', 'X', 'X'],
        ['O', 'O', 'O', 'O', 'O'],
        ['O', 'X', 'X', 'X', 'X'],
        ['O', 'O', 'O', 'O', 'O'],
        ['O', 'O', 'C', 'O', 'O'],
        ['O', 'O', 'O', 'O', 'O'],
      ]
      
      # closest_carrot(grid, 3, 4) # -> 9
      expect(closest_carrot(grid, 3, 4)).to eq(9)
    end

    it "test case 2" do
      grid = [
        ['O', 'O', 'X', 'O', 'O'],
        ['O', 'X', 'X', 'X', 'O'],
        ['O', 'X', 'C', 'C', 'O'],
      ]
      
      # closest_carrot(grid, 2, 0) # -> -1
      expect(closest_carrot(grid, 2, 0)).to eq(-1)
    end

    it  "test case 3" do
      grid = [
        ['O', 'O', 'X', 'C', 'O'],
        ['O', 'X', 'X', 'X', 'O'],
        ['C', 'X', 'O', 'O', 'O'],
      ]
      
      # closest_carrot(grid, 2, 2) # -> 5
      expect(closest_carrot(grid, 2, 2)).to eq(5)
    end
  end

  describe "longest_path" do
    it "test case 1" do
      graph = {
        'a'=> ['c', 'b'],
        'b'=> ['c'],
        'c'=> []
      }
      
      # longest_path(graph) # -> 2
      expect(longest_path(graph)).to eq(2)
    end

    it "test case 2" do
      graph = {
        'a'=> ['c', 'b'],
        'b'=> ['c'],
        'c'=> [],
        'q'=> ['r'],
        'r'=> ['s', 'u', 't'],
        's'=> ['t'],
        't'=> ['u'],
        'u'=> []
      }
      
      # longest_path(graph) # -> 4
      expect(longest_path(graph)).to eq(4)
    end

    it "test case 3" do 
      graph = {
        'a'=> ['b'],
        'b'=> ['c'],
        'c'=> [],
        'e'=> ['f'],
        'f'=> ['g'],
        'g'=> ['h'],
        'h'=> []
      }
      
      # longest_path(graph) # -> 3
      expect(longest_path(graph)).to eq(3)
    end

    it "test case 4" do 
      graph = {
        'h'=> ['i', 'j', 'k'],
        'g'=> ['h'],
        'i'=> [],
        'j'=> [],
        'k'=> [],
        'x'=> ['y'],
        'y'=> []
      }
      
      # longest_path(graph) # -> 2
      expect(longest_path(graph)).to eq(2)
    end
  end

  describe "semesters_required" do
    it "test case 1" do
      num_courses = 6
      prereqs = [
        [1, 2],
        [2, 4],
        [3, 5],
        [0, 5],
      ]
      # semesters_required(num_courses, prereqs) # -> 3
      expect(semesters_required(num_courses, prereqs)).to eq(3)
    end

    it "test case 2" do
      num_courses = 7
      prereqs = [
        [4, 3],
        [3, 2],
        [2, 1],
        [1, 0],
        [5, 2],
        [5, 6],
      ]
      # semesters_required(num_courses, prereqs) # -> 5
      expect(semesters_required(num_courses, prereqs)).to eq(5)
    end
  end

  describe "best_bridge" do
    it "test case 1" do
      grid = [
        ["W", "W", "W", "L", "L"],
        ["L", "L", "W", "W", "L"],
        ["L", "L", "L", "W", "L"],
        ["W", "L", "W", "W", "W"],
        ["W", "W", "W", "W", "W"],
        ["W", "W", "W", "W", "W"],
      ]
      expect(best_bridge(grid)).to eq(1)
    end

    it "test case 2" do
      grid = [
        ["W", "W", "W", "W", "W"],
        ["W", "W", "W", "W", "W"],
        ["L", "L", "W", "W", "L"],
        ["W", "L", "W", "W", "L"],
        ["W", "W", "W", "L", "L"],
        ["W", "W", "W", "W", "W"],
      ]
      expect(best_bridge(grid)).to eq(2)
    end

    it "test case 3" do
      grid = [
        ["W", "L", "W", "W", "W", "W", "W", "W"],
        ["W", "L", "W", "W", "W", "W", "W", "W"],
        ["W", "W", "W", "W", "W", "W", "W", "W"],
        ["W", "W", "W", "W", "W", "W", "W", "W"],
        ["W", "W", "W", "W", "W", "W", "W", "W"],
        ["W", "W", "W", "W", "W", "W", "L", "W"],
        ["W", "W", "W", "W", "W", "W", "L", "L"],
        ["W", "W", "W", "W", "W", "W", "W", "L"],
      ]
      # best_bridge(grid) # -> 8
      expect(best_bridge(grid)).to eq(8)
    end
  end

  describe "has_cycle" do
    it "test case 1" do
      expect(has_cycle?({
        "a" => ["b"],
        "b" => ["c"],
        "c" => ["a"],
      })).to eq(true)
    end

    it "test case 2" do
      expect(has_cycle?({
        "a"=> ["b", "c"],
        "b"=> ["c"],
        "c"=> ["d"],
        "d"=> [],
      })).to eq(false)
    end

    it "test case 3" do
      expect(has_cycle?({
        "a"=> ["b"],
        "b"=> ["c"],
        "c"=> ["d"],
        "d"=> ["b"],
      })).to eq(true)
    end

    it "test case 4" do
      expect(has_cycle?({
        "a"=> ["b"],
        "b"=> ["c"],
        "c"=> ["a"],
        "g"=> [],
      })).to eq(true)
    end
  end

  describe "prereqs_possible" do
    it "test case 1" do
      numCourses = 6
      prereqs = [
        [0, 1],
        [2, 3],
        [0, 2],
        [1, 3],
        [4, 5],
      ]
      # prereqs_possible(numCourses, prereqs) # -> True
      expect(prereqs_possible(numCourses, prereqs)).to eq(true)
    end

    it "test case 2" do
      numCourses = 8
      prereqs = [
        [1, 0],
        [0, 6],
        [2, 0],
        [0, 5],
        [3, 7],
        [7, 4],
        [4, 3],
      ]
      # prereqs_possible(numCourses, prereqs) # -> False
      expect(prereqs_possible(numCourses, prereqs)).to eq(false)
    end

    it "test case 3" do
      numCourses = 8
      prereqs = [
        [1, 0],
        [0, 6],
        [2, 0],
        [0, 5],
        [3, 7],
        [4, 3],
      ]
      # prereqs_possible(numCourses, prereqs) # -> True
      expect(prereqs_possible(numCourses, prereqs)).to eq(true)
    end
  end
end