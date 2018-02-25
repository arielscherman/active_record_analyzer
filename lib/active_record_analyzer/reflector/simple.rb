class ActiveRecordAnalyzer::Reflector::Simple
  def initialize(klass)
    @klass = klass
  end

  def has_attribute?(attribute)
    attributes.include?(attribute.to_sym)
  end

  def attribute_type
    @attribute_type ||= ActiveRecordAnalyzer::Attribute::Simple
  end

  # This returns attributes which are not foreign keys (ex: :name, but not :company_id)
  #
  def attributes
    attributes_except_foreign_keys
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
    @foreign_keys ||= ActiveRecordAnalyzer::Reflector::Association.new(@klass).attributes
  end
end