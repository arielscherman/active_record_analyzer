class ActiveRecordAnalyzer::Attribute::Simple
  def association?
    false
  end

  def simple_attribute?
    true
  end

  def has_many?
    false
  end

  def one_to_many?
    false
  end
end