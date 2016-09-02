# encoding: utf-8

require "bar_of_progress/version"

require 'bigdecimal'

class BarOfProgress
  DEFAULTS = {
    :total => 100,
    :length => 10,
    :braces => %w{[ ]},
    :complete_indicator => "●",
    :partial_indicator => "◍",
    :incomplete_indicator => "◌",
    :precision => 20
  }

  def initialize(options = {})
    @options = DEFAULTS.merge(options)

    #massage data because eww.
    @options[:total] = to_d(@options[:total])
    @options[:length] = @options[:length].to_i
  end

  def progress(amount = 0)
    bubbles = clamped_bubbles_for(amount)
    Output.new(bubbles.floor, partial_bubbles_for(bubbles), @options).to_s
  end

private

  def clamped_bubbles_for(amount)
    to_d(clamp(bubbles_for(amount), 0, @options[:length]))
  end

  def partial_bubbles_for(bubbles)
    bubbles.truncate(@options[:precision]) % 1 == 0 ? 0 : 1
  end

  def bubbles_for(amount)
    (to_d(amount) / @options[:total]) * @options[:length]
  end

  # This method is amazing.
  def clamp(n, min, max)
    [[n, min].max, max].min
  end

  def to_d(thing)
    if thing.kind_of?(Float)
      BigDecimal(thing, Float::DIG)
    else
      BigDecimal(thing)
    end
  end

  class Output
    def initialize(complete, partial, options)
      @complete = complete
      @partial = partial
      @options = options
    end

    def to_s
      "#{left_bracket}#{complete}#{partial}#{incomplete}#{right_bracket}"
    end

  private

    def left_bracket
      @options[:braces][0]
    end

    def complete
      chars(@options[:complete_indicator], @complete)
    end

    def partial
      @options[:partial_indicator] if @partial > 0
    end

    def incomplete
      chars(@options[:incomplete_indicator], (@options[:length] - @complete - @partial))
    end

    def right_bracket
      @options[:braces][1]
    end

    def chars(char, n)
      return "" if n <= 0
      char * n
    end
  end
end
