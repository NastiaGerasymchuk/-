class Nominal
  def initialize(name)
    @@name = name
  end

  def name
    @@name
  end

  def name=(name)
    @@name = name
  end

  def getName
    [name]
  end

  def as_json()
    { name: name }
  end
end
