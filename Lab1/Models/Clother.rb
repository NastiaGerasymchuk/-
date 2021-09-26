require_relative 'Trend'

class Clother
  #TODO objects
  def initialize(id, description, trend, price, currency, img, gender = '', category = '')
    @@id = id
    @@description = description.strip
    @@trend = Trend.new(trend)
    @@price = price.to_f
    @@currency = Nominal.new(currency)
    @@img = img.to_s
    @@gender = Gender.new(gender)
    @@category = Category.new(category)
  end

  def id
    @@id || ''
  end

  def description
    @@description || ''
  end

  def trend
    @@trend.name.gsub(/\s/, "") || ''
  end

  def price
    @@price || 0
  end

  def currency
    @@currency.name || ''
  end

  def img
    @@img || ''
  end

  def gender
    @@gender.gender || []
  end

  def gender=(gender)
    @@gender = Gender.new(gender)
  end

  def category
    @@category.name || ''
  end

  def category=(category)
    @@category = Category.new(category)
  end

  def getClother
    [id, description, trend, price, currency, img, gender, category]
  end

  def as_json()
    {
      id: id,
      description: description,
      trend: @@trend.as_json(),
      price: price,
      currency: @@currency.as_json(),
      img: img,
      gender: @@gender.as_json(),
      category: @@category.as_json(),
    }
  end

end