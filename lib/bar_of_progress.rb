require "bar_of_progress/version"

class BarOfProgress
  def initialize
    @complete = 100.0
  end

  def progress(amount = 0)
    bubbles = ((amount / @complete) * 10)
    full_bubbles = bubbles.floor
    partial_bubbles = bubbles % 1 == 0 ? 0 : 1
    "[#{'●' * full_bubbles}#{'◍' * partial_bubbles}#{'◌' * (10 - full_bubbles - partial_bubbles)}]"
  end
end
