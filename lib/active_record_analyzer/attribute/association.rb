class ActiveRecordAnalyzer::Attribute::Association
  def association?
    true
  end

  def simple_attribute?
    false
  end
end