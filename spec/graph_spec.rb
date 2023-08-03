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