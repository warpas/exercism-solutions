class Hamming
  def self.compute(strand, strand2)
    raise ArgumentError if strand.length != strand2.length

    differences = 0
    strand1_array = strand.chars
    strand2_array = strand2.chars
    0.upto(strand.length - 1) do |index|
      differences += 1 if strand1_array[index] != strand2_array[index]
    end
    differences
  end
end
