class Robot
  def self.forget
  end

  def initialize
    @old_names = []
  end

  def name
    # p @old_names
    if @old_names.empty?
      'AX532'
    else
      'EC152'
    end
  end

  def reset
    @old_names << name
  end
end
