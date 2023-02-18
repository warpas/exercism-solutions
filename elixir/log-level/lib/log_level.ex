defmodule LogLevel do
  @levels %{
    0 => %{level: :trace, legacy: false},
    1 => %{level: :debug, legacy: true},
    2 => %{level: :info, legacy: true},
    3 => %{level: :warning, legacy: true},
    4 => %{level: :error, legacy: true},
    5 => %{level: :fatal, legacy: false},
  }

  def to_label(level, legacy?) do
    if(level >= 0 && level <= 5) do
      current_level = @levels[level]
      if(legacy? && !current_level[:legacy]) do
        :unknown
      else
        current_level[:level]
      end
    else
      :unknown
    end
  end

  def alert_recipient(level, legacy?) do
    # Please implement the alert_recipient/2 function
  end
end
