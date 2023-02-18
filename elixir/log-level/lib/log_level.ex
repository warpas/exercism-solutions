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
    cond do
      level >= 0 and level <= 5 and !legacy? -> @levels[level][:level]
      level >= 0 and level <= 5 and legacy? and @levels[level][:legacy] -> @levels[level][:level]
      true -> :unknown
    end
  end

  def alert_recipient(level, legacy?) do
    log_label = %{label: to_label(level, legacy?), legacy: legacy?}

    case log_label do
      %{label: :error} -> :ops
      %{label: :fatal} -> :ops
      %{label: :unknown, legacy: true} -> :dev1
      %{label: :unknown, legacy: false} -> :dev2
      _ -> false
    end
  end
end
