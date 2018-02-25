class ActiveRecordAnalyzer::Attribute::BelongsTo
  def association?
    true
  end

  def simple_attribute?
    false
  end

  def has_many?
    false
  end

  def one_to_many?
    true
  end
end