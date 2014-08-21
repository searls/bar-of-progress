require "bar_of_progress/version"

class BarOfProgress
  def progress(amount = 0)
    if amount == 0
      "[◌◌◌◌◌◌◌◌◌◌]"
    else
      "[●●●●●●●●●●]"
    end
  end
end
