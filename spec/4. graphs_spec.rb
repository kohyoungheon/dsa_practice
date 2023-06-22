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

    end
  end
end