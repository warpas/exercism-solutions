class ResistorColorDuo
  CODES = %w[black brown red orange yellow green blue violet grey white].freeze

  def self.value(colors)
    colors.take(2).map { |c| CODES.index(c) }.join.to_i
  end
end
