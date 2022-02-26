class Tournament
  attr_accessor :result

  def self.tally(input)
    new.tally(input)
  end

  def initialize
    @result = {}
  end

  def tally(input)
    input.each_line { |line| record(line.chomp) }

    result = self.result.sort_by { |name, v| [-v[4], name] }

    result.unshift(['Team', %w[MP W D L P]])

    result.map { |team, entry| format_entry(team, entry) }.join
  end

  private

  def format_entry(team, entry)
    format("%-31s|%3s |%3s |%3s |%3s |%3s\n", team, *entry)
  end

  def record(line)
    team_a, team_b, result = line.split(';')

    case result
    when 'win'
      record_win(team_a)
      record_loss(team_b)
    when 'loss'
      record_loss(team_a)
      record_win(team_b)
    when 'draw'
      record_draw(team_a)
      record_draw(team_b)
    end
  end

  def record_win(team)
    record = result[team] || [0, 0, 0, 0, 0]
    record[0] += 1
    record[1] += 1
    record[4] += 3
    result[team] = record
  end

  def record_loss(team)
    record = result[team] || [0, 0, 0, 0, 0]
    record[0] += 1
    record[3] += 1
    result[team] = record
  end

  def record_draw(team)
    record = result[team] || [0, 0, 0, 0, 0]
    record[0] += 1
    record[2] += 1
    record[4] += 1
    result[team] = record
  end
end
