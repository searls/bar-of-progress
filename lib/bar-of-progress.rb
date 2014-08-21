require "bar_of_progress/version"

class BarOfProgress
  DEFAULTS = {
    :total => 100.0,
    :length => 10,
    :braces => %w{[ ]},
    :complete_indicator => "●",
    :partial_indicator => "◍",
    :incomplete_indicator => "◌"
  }

  def initialize(options = {})
    @options = DEFAULTS.merge(options)
  end

  def progress(amount = 0)
    bubbles = betwixt(((amount / @options[:total]) * 10), 0, 10)
    full_bubbles = bubbles.floor
    partial_bubbles = bubbles % 1 == 0 ? 0 : 1
    "[#{chars('●', full_bubbles)}#{chars('◍', partial_bubbles)}#{chars('◌', (10 - full_bubbles - partial_bubbles))}]"
  end

private

  # This method is amazing.
  def betwixt(n, min, max)
    [[n, min].max, max].min
  end

  def chars(char, n)
    return "" if n <= 0
    char * n
  end
end
