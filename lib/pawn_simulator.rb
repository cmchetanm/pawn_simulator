require_relative 'pawn'
require_relative 'chart'

class PawnSimulator

  def initialize
    @chart = Chart.new
    @pawn = Pawn.new(@chart)
  end

  def call(command)
    begin
      puts @pawn.perform(command)
    rescue Exception => e
      puts e.message
    end
  end
end
