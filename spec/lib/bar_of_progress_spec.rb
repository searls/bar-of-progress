require 'bar_of_progress'

describe BarOfProgress do
  context "vanilla default progress bar" do
    subject { BarOfProgress.new }

    Then { subject.progress == "[◌◌◌◌◌◌◌◌◌◌]" }
    Then { subject.progress(50) == "[●●●●●◌◌◌◌◌]" }
    Then { subject.progress(100) == "[●●●●●●●●●●]" }

  end
end
