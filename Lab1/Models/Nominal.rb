class Nominal
  def initialize(name)
    @@name = name.split
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
end
