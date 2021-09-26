class Trend
  def initialize(name)
    @@name = name
  end

  def name
    @@name
  end

  def name=(name)
    @@name = name
  end

  def getTrend
    [name]
  end

  public def as_json()
    {
      name: name,
    }
  end
end
