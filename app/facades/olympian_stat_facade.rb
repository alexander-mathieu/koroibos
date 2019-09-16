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
      unit: 'cm',
      female_olympians: Olympian.olympian_average('height', 'F').round(2),
      male_olympians: Olympian.olympian_average('height', 'M').round(2)
    }
  end

  def average_weight
    {
      unit: 'kg',
      female_olympians: Olympian.olympian_average('weight', 'F').round(2),
      male_olympians: Olympian.olympian_average('weight', 'M').round(2)
    }
  end

  def average_age
    Olympian.olympian_average('age', [ 'F', 'M' ]).round(2)
  end
end
