#= PermutationGenerator
#
#== Install
#  $ sudo gem install permutation_generator
#
#== Usage
#  require 'rubygems'
#  require 'permutation_generator'
#  PermutationGenerator.new(2, ["r", "b", "g"]).each do |element|
#    p element
#  end 
#
#  # output -- ["r", "r"] ["r", "b"] ["r", "g"] ["b", "r"] ["b", "b"] ["b", "g"] ["g", "r"] ["g", "b"] ["g", "g"] 
#Copyright (c) 2010  MIT-LICENSE
#Author : Wayne Deng
#Web    : http://blog.waynedeng.com
#Email  : wayne.deng.cn(AT).com

class PermutationGenerator
  attr_accessor :size, :elements
  
  def initialize(picking_size, elements)
    self.elements = elements
    self.size = picking_size
  end

  def each (&block)
    (1..self.permutation_size).each do |i|
      yield self.ary(i-1)
    end
  end

  def each_with_index (&block)
    (1..self.permutation_size).each do |i|
      yield self.ary(i-1), i-1
    end
  end

  def permutation_size
    self.elements.size ** self.size
  end

  protected
  def ary(case_index)
    self.index_ary(case_index).map{|i| self.elements[i]}
  end
  
  def index_ary(case_index)
    _ary = []
    _value = case_index
    (1..self.size).each do |i|
      _ary[i - 1], _value = (_value % self.elements.size), (_value / self.elements.size).to_i
    end
    _ary.reverse
  end

end

