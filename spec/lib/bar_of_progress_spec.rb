# encoding: utf-8

require 'bar-of-progress'

describe BarOfProgress do
  context "vanilla default progress bar" do
    subject { BarOfProgress.new }

    Then { subject.progress(-1) == "[◌◌◌◌◌◌◌◌◌◌]" }
    Then { subject.progress == "[◌◌◌◌◌◌◌◌◌◌]" }
    Then { subject.progress(0) == "[◌◌◌◌◌◌◌◌◌◌]" }
    Then { subject.progress(49) == "[●●●●◍◌◌◌◌◌]" }
    Then { subject.progress(50) == "[●●●●●◌◌◌◌◌]" }
    Then { subject.progress(100) == "[●●●●●●●●●●]" }
    Then { subject.progress(101) == "[●●●●●●●●●●]" }
  end

  context "awesome bejazzled custom progress bar" do
    subject { BarOfProgress.new(
      :total => 115.5,
      :length => 14,
      :braces => %w{( )},
      :complete_indicator => "■",
      :partial_indicator => "▤",
      :incomplete_indicator => "□"
    ) }

    Then { subject.progress == "(□□□□□□□□□□□□□□)" }
    Then { subject.progress(30) == "(■■■▤□□□□□□□□□□)" }
    Then { subject.progress(33) == "(■■■■□□□□□□□□□□)" }
    Then { subject.progress(115.5) == "(■■■■■■■■■■■■■■)" }
  end
end
