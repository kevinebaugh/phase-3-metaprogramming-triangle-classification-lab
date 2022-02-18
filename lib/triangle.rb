require "pry"

class Triangle

  def initialize(side1, side2, side3)
    @sides = [side1, side2, side3]

    if @sides.include?(0) || @sides.any?(&:negative?) || !passes_inequality?
      puts "Raising! #{@sides}"
      puts "@sides.include?(0) #{@sides.include?(0)}"
      puts "@sides.any?(&:negative?) #{@sides.any?(&:negative?)}"
      puts "!passes_inequality? #{!passes_inequality?}"
      raise TriangleError
    end
  end

  def kind
    if @sides.uniq.size == 1
      :equilateral
    elsif @sides.uniq.size == 2
      :isosceles
    elsif @sides.uniq.size == 3
      :scalene
    end
  end

  class TriangleError < StandardError
    puts "Problem: @sides"
  end

  private

  def passes_inequality?
    sides = @sides.dup
    largest_side = @sides.max
    sides.delete_at(sides.index(largest_side))

    if sides.sum > largest_side
      true
    else
      false
    end
  end
end
