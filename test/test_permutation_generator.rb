# -*- coding: utf-8 -*-
require File.join(File.dirname(__FILE__),"..","lib","permutation_generator.rb")
require 'test/unit'

class TestPermutationGenerator < Test::Unit::TestCase
  def test_each
    ary = []
    PermutationGenerator.new(2, [1,2,3]).each{|ai| ary << ai}
    assert_equal ary, [[1,1],[1,2],[1,3],[2,1],[2,2],[2,3],[3,1],[3,2],[3,3]]
    
    ary = []
    PermutationGenerator.new(2, ["a", "b"]).each{|ai| ary << ai}
    assert_equal ary, [["a","a"],["a","b"],["b","a"],["b", "b"]]
    
  end
end
