class Series
  def initialize(string)
    @series = string
  end

  def slices(substring_length)
    valid_substring_length = @series.length - substring_length
    raise ArgumentError if valid_substring_length.negative?

    substrings = []
    0.upto(valid_substring_length) do |index|
      substrings << @series[index, substring_length]
    end
    substrings
  end
end
