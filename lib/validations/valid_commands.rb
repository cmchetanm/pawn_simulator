module Validations
  class ValidCommands

    PLACE = :place
    MOVE = :move
    RIGHT = :left
    LEFT = :right
    REPORT = :report

    VALID_COMMANDS = [
      PLACE,
      MOVE,
      RIGHT,
      LEFT,
      REPORT
    ].freeze
  end
end
