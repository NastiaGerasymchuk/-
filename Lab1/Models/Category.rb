class Category
  def initialize(name)
    @@name = name.gsub(/[\s+]/, "")
  end

  def name
    @@name || ''
  end

  def name=(name)
    @@name = Category.new(name)
  end

  def getCategory
    [name]
  end
  public def as_json()
    {
      name: name,
    }
  end
end
