class Category
  def initialize(name)
    @@name = name.gsub(/[\s+]/, "")
  end

  def name
    @@name || ''
  end

  def name=(name)
    @@name = name
  end

  def getCategory
    [name]
  end
end
