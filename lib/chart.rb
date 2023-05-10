class Chart
  attr_reader :rows, :columns

  def initialize(rows = 8, columns = 8)
    raise TypeError, 'Invalid rows/columns. Please enter valid values' unless rows.is_a? Integer and columns.is_a? Integer

    @rows = rows
    @columns = columns
  end

end