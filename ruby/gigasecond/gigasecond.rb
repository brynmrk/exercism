module BookKeeping
  VERSION = 5
end

class Gigasecond
  def self.from(from_time)
    from_time + 1_000_000_000
  end
end