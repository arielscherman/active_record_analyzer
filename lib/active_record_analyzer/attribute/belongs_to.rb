class ActiveRecordAnalyzer::Attribute::BelongsTo
  def self.association?
    true
  end

  def self.simple_attribute?
    false
  end

  def self.has_many?
    false
  end

  def self.one_to_many?
    true
  end
end