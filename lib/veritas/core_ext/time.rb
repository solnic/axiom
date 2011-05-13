# encoding: utf-8

# Extend Time with methods to find the previous Time
class Time

  # Decrement the Time by one second
  #
  # @example
  #   previous_second = time.pred
  #
  # @return [Time]
  #
  # @api public
  def pred
    self - 1
  end unless method_defined? :pred

end # class Time
