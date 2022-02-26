class Garden
  PLANTS = ["Violets", "Radishes", "Clover", "Grass"].freeze
  STUDENTS = ["Alice", "Bob", "Charlie", "David", "Eve", "Fred", "Ginny", "Harriet", "Ileana", "Joseph", "Kincaid", "Larry"].freeze

  def initialize(plants_diagram, stnds = STUDENTS)
    @plants_diagram_r1 = plants_diagram.split("\n")[0].chars
    @plants_diagram_r2 = plants_diagram.split("\n")[1].chars
    @students = stnds.sort
    @combinations = (0..(@students.length*2)-1).each_slice(2).to_a

    @students.map.with_index do |student, idx|
      define_singleton_method(student.downcase.to_sym) do
        r1_plants = @plants_diagram_r1[@combinations[idx][0]..@combinations[idx][1]]
        r2_plants = @plants_diagram_r2[@combinations[idx][0]..@combinations[idx][1]]

        (r1_plants + r2_plants).map do |owned_plant|
          PLANTS.select { |plant| plant.start_with?(owned_plant) }[0]&.downcase&.to_sym
        end
      end
    end
  end
end
