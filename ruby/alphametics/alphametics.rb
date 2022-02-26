class Alphametics
  ALPHA = /[a-z]/.freeze

  def self.solve(str)
    self.new(str.downcase).solve
  end

  def initialize(str)
    @puzzle = str
  end

  def solve
    all_combos.each do |values|
      return letters.map(&:upcase).zip(values).to_h if solver.call(values)
    end
    {} # no solution found
  end

  private

  attr_reader :solver, :letters

  def all_combos
    parse unless solver
    (0..9).to_a.permutation(letters.size)
  end

  def parse
    left, right = @puzzle.split("==")
    left_terms = left.split("+").map(&:strip)
    right_term = right.strip
    # right side solution will often start with a 1 so front loading it
    # here will save us ever trying 2-9 in many cases, providing a huge
    # speed increase for many puzzles
    @letters = @puzzle.scan(ALPHA).unshift(right_term.chr).uniq
    @solver =  build_solver(left_terms, right_term)
  end

  def build_solver(left, right)
    arguments = letters.join(", ")
    left_side_equals_right = "#{to_code(left)} == #{to_code(right)}"
    first_digit_never_zero = first_letters.map {|x| "(#{x} != 0)"}.join(" && ")
    eval """
      Proc.new do |#{arguments}|
        #{first_digit_never_zero} && #{left_side_equals_right}
      end
    """
  end

  def first_letters
    @puzzle.scan(/\b#{ALPHA}/).uniq
  end

  # convert "ABC" into Ruby code `a*100 + b*10 + c`
  def to_code(term)
    return term.map(&method(:to_code)).join(" + ") if term.is_a? Array
    term.reverse
      .each_char.with_index
      .map {|x,i| i>0 ? "#{x}*#{10**i}" : x }
      .reverse.join(" + ")
  end
end
