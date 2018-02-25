class ActiveRecordAnalyzer::Reflector
  ERROR_INVALID_ATTRIBUTE = "There is no %s in the class %s".freeze

  def initialize(klass)
    @klass = klass
  end

  def reflect(attribute)
    validate_attribute!(attribute)
    if association_names.include?(attribute)
      
    elsif simple_attribute_names.include?(attribute)
      ActiveRecordAnalyzer::Attribute::Simple.new
    end
  end

  def attribute_names
    simple_attribute_names.merge(association_names)
  end

  def simple_attribute_names
    @klass.attribute_names
  end

  # This returns foreign_keys and association names (ex: :company_id and :company).
  def association_names
    @association_names ||= begin
      @klass.reflect_on_all_associations.map do |assoc|
        [assoc.foreign_key.to_sym, assoc.name]
      end.flatten
    end
  end

  private

  def validate_attribute!(attribute)
    return if attribute_names.include?(attribute.to_s)
    fail format(ERROR_INVALID_ATTRIBUTE, attribute, @klass.name)
  end
end