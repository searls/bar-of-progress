require 'bar_of_progress'

describe BarOfProgress do
  context "vanilla default progress bar" do
    subject { BarOfProgress.new }

    When(:result) { subject.progress }

    describe "initial progress" do
      Then { result == "[◌◌◌◌◌◌◌◌◌◌]" }
    end
  end
end
