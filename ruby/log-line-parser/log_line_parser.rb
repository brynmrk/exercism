class LogLineParser
  attr_accessor :message, :log_level, :line

  def initialize(line)
    @line = line.gsub(/(\r|\n|\t|\[|\])*/, '')
    @log_level = @line.split(/:(\s)*/)[0]
    @message = @line.split(/:(\s)*/)[2].strip
    @log_level = @log_level.downcase
  end

  def reformat
    "#{@message} (#{@log_level})"
  end
end
