class Clother
  def initialize(id, description, trend, price, currency, img, gender = '', category = '')
    @@id = id
    @@description = description.strip
    @@trend = trend.strip
    @@price = price.to_f
    @@currency = currency
    @@img = img.to_s
    @@gender = gender
    @@category = category
  end

  def id
    @@id || ''
  end

  def description
    @@description || ''
  end

  def trend
    @@trend || ''
  end

  def price
    @@price || 0
  end

  def currency
    @@currency || ''
  end

  def img
    @@img || ''
  end

  def gender
    @@gender || []
  end

  def gender=(gender)
    @@gender = gender
  end

  def category
    @@category || []
  end

  def category=(category)
    @@category = category
  end

  def getClother
    [id, description, trend, price, currency, img, gender, category]
  end

end