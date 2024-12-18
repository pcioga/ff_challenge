# frozen_string_literal: true

require 'set'

class MissingNumber
  def self.find_missing_number(arr, nth: 1)
    return nth if arr.empty?

    number_set = arr.to_set

    min = 1
    max = arr.max + nth

    while min <= max
      mid = (min + max) / 2
      missing = missing_in_interval(mid, number_set)

      # Check if should be looking on the lower or higher subset
      if missing < nth
        min = mid + 1
      elsif missing > nth
        max = mid - 1
      else
        # Found position with exactly n missing numbers returns largest
        mid -= 1 while number_set.include?(mid)
        return mid
      end
    end

    min
  end

  def self.missing_in_interval(mid, set)
    return 0 if mid < 1

    present_numbers = set.count { |i| i <= mid }
    mid - present_numbers
  end
end
