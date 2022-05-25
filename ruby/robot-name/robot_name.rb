class Robot
  def self.forget
  end

  def initialize
    @old_names = []
  end

  def name
    @name ||= new_name
  end

  def reset
    @old_names << name
    @name = new_name
  end

  private

  def new_name
    if @old_names.empty?
      "AX#{rand(100..999)}"
    else
      "EC#{rand(100..999)}"
    end
  end
end
