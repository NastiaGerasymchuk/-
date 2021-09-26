class Gender
  def initialize(gender)
    @@gender = gender.gsub(/[\s+]/, "")
  end

  def gender
    @@gender
  end

  def gender=(gender)
    @@gender = gender
  end

  def getGender
    [gender]
  end

  def as_json()
    { name: gender }
  end
end
