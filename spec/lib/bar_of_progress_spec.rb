require 'bar_of_progress'

describe BarOfProgress do
  context "vanilla default progress bar" do
    subject { BarOfProgress.new }


    describe "initial progress" do
      When(:result) { subject.progress }
      Then { result == "[◌◌◌◌◌◌◌◌◌◌]" }
    end

    describe "100% progress" do
      When(:result) { subject.progress(100) }
      Then { result == "[●●●●●●●●●●]" }
    end

    describe "50% progress" do
      When(:result) { subject.progress(50) }
      Then { result == "[●●●●●◌◌◌◌◌]" }
    end
  end
end
