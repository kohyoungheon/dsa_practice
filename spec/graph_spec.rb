require './graph.rb'
require 'rspec'

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