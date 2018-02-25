class ActiveRecordAnalyzer::Attribute::HasMany
  def self.association?
    true
  end

  def self.simple_attribute?
    false
  end

  def self.has_many?
    true
  end

  def self.one_to_many?
    false
  end
end