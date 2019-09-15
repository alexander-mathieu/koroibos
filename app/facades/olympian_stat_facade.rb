class OlympianStatFacade
  attr_reader :id

  def initialize
    @id = nil
  end

  def total_competing_olympians
    Olympian.total_competing_olympians
  end

  def average_height
    {
      female_olympians: Olympian.olympian_average('height', 'F'),
      male_olympians: Olympian.olympian_average('height', 'M')
    }
  end

  def average_weight
    {
      female_olympians: Olympian.olympian_average('weight', 'F'),
      male_olympians: Olympian.olympian_average('weight', 'M')
    }
  end

  def average_age
    Olympian.olympian_average('age', [ 'F', 'M' ])
  end
end
