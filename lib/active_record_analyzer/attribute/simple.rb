class ActiveRecordAnalyzer::Attribute::Simple
  def self.association?
    false
  end

  def self.simple_attribute?
    true
  end

  def self.has_many?
    false
  end

  def self.one_to_many?
    false
  end
end