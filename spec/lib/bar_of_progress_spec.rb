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
end
