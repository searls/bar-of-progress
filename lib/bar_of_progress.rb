require "bar_of_progress/version"

class BarOfProgress
  def initialize
    @complete = 100.0
  end

  def progress(amount = 0)
    bubbles = ((amount / @complete) * 10).round
    "[#{'●' * bubbles}#{'◌' * (10 - bubbles)}]"
  end
end
