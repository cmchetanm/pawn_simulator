require_relative 'validations/direction'
require_relative 'validations/valid_commands'
require_relative 'validations/position'
require_relative 'validations/color'
require_relative 'process/command'

class Pawn
  attr_reader :position, :direction, :chart, :color

  def initialize(chart)
    raise TypeError, 'Invalid chart' if chart.nil?

    @chart = chart
  end

  def perform(command)
    return if command.strip.empty?

    command_action = ::Process::Command.interpret(command)
    send(command_action[:method_name], *command_action[:params])
  end

  def place(x, y, direction, color)
    raise TypeError, 'Invalid coordinates' unless x.is_a? Integer and y.is_a? Integer
    raise TypeError, 'Invalid direction' unless ::Validations::Direction::VALID_DIRECTIONS.include?(direction)
    raise TypeError, 'Invalid color' unless ::Validations::Color::VALID_COLORS.include?(color)

    if ::Validations::Position.valid?(x, y, self.chart)
      @position = { x: x, y: y } and @direction = direction and @color = color
      true
    else
      false
    end
  end

  def move(step)
    return false if @position.nil?

    movement = ::Validations::Direction.move_in_direction(@direction, step)

    if ::Validations::Position.valid?(@position[:x] + movement[:x], @position[:y] + movement[:y], self.chart)
      @position = { x: @position[:x] + movement[:x], y: @position[:y] + movement[:y] } and return true
    end

    false
  end

  def rotate_left
    return false if @direction.nil?

    rotate_index = ::Validations::Direction::VALID_DIRECTIONS.index(@direction)
    @direction = ::Validations::Direction::VALID_DIRECTIONS.rotate(-1)[rotate_index]
  end

  def rotate_right
    return false if @direction.nil?

    rotate_index = ::Validations::Direction::VALID_DIRECTIONS.index(@direction)
    @direction = ::Validations::Direction::VALID_DIRECTIONS.rotate()[rotate_index]
  end

  def report
    return "Not on chart" if @position.nil? or @direction.nil?

    "#{@position[:x]},#{@position[:y]},#{@direction.to_s.upcase},#{@color.to_s.upcase}"
  end
end
