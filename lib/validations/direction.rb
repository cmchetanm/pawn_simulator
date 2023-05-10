module Validations
  class Direction

    NORTH = :north
    EAST = :east
    WEST = :west
    SOUTH = :south

    # DON'T CHANGE POSITIONS HERE
    VALID_DIRECTIONS = [
      NORTH,
      EAST,
      SOUTH,
      WEST
    ].freeze

    def self.move_in_direction(direction, step)
      next_direction = { x: 0, y: 0}

      next_direction[:y] = step if direction === NORTH
      next_direction[:x] = step if direction === EAST
      next_direction[:y] = -step if direction === SOUTH
      next_direction[:x] = -step if direction === WEST

      return next_direction
    end
  end
end
