module ApplicationHelper
  def format_steps(steps)
    if steps < 1000
      "#{steps}"
    elsif steps < 1_000_000
      "#{(steps / 1000.0).round(1).to_i == (steps / 1000.0).round(1) ? (steps / 1000.0).round(1).to_i : (steps / 1000.0).round(1)}k"
    else
      "#{(steps / 1_000_000.0).round(1).to_i == (steps / 1_000_000.0).round(1) ? (steps / 1_000_000.0).round(1).to_i : (steps / 1_000_000.0).round(1)}M"
    end
  end
end
