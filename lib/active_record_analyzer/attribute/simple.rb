class ActiveRecordAnalyzer::Attribute::Simple
  def association?
    false
  end

  def simple_attribute?
    true
  end
end