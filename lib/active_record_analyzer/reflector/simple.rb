class ActiveRecordAnalyzer::Reflector::Simple < ActiveRecordAnalyzer::Reflector::Base
  # This returns attributes which are not foreign keys (ex: :name, but not :company_id)
  #
  def attributes
    attributes_except_foreign_keys
  end

  def attribute_type
    @attribute_type ||= ActiveRecordAnalyzer::Attribute::Simple
  end

  private

  def attributes_except_foreign_keys
    @attributes ||= begin
      all_attribute_names.select { |attr| !foreign_keys.include?(attr) }
    end
  end

  def all_attribute_names
    @all_attribute_names ||= @klass.attribute_names.map(&:to_sym)
  end

  def foreign_keys
    @foreign_keys ||= ActiveRecordAnalyzer::Reflector::BelongsTo.new(@klass).attributes
  end
end