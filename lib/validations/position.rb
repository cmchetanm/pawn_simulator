module Validations
  class Position

    def self.valid?(x, y, chart)
      (x >= 0 && x <= chart.columns && y >= 0 && y <= chart.rows)
    end
  end
end
