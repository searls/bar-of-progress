require "bar_of_progress/version"

require 'bigdecimal'
require 'bigdecimal/util'

class BarOfProgress
  DEFAULTS = {
    :total => 100,
    :length => 10,
    :braces => %w{[ ]},
    :complete_indicator => "●",
    :partial_indicator => "◍",
    :incomplete_indicator => "◌"
  }

  def initialize(options = {})
    @options = DEFAULTS.merge(options)

    #massage data because eww.
    @options[:total] = @options[:total].to_d
    @options[:length] = @options[:length].to_i
  end

  def progress(amount = 0)
    bubbles = betwixt(((amount.to_d / @options[:total]) * @options[:length]), 0, @options[:length])
    full_bubbles = bubbles.floor
    partial_bubbles = bubbles % 1 == 0 ? 0 : 1
    "#{@options[:braces][0]}#{chars(@options[:complete_indicator], full_bubbles)}#{chars(@options[:partial_indicator], partial_bubbles)}#{chars(@options[:incomplete_indicator], (@options[:length] - full_bubbles - partial_bubbles))}#{@options[:braces][1]}"
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
