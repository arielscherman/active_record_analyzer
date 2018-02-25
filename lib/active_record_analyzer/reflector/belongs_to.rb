class ActiveRecordAnalyzer::Reflector::BelongsTo
  def initialize(klass)
    @klass = klass
  end

  def has_attribute?(attribute)
    attributes.include?(attribute.to_sym)
  end

  def attribute_type
    @attribute_type ||= ActiveRecordAnalyzer::Attribute::BelongsTo
  end

  # This returns foreign_keys and association names (ex: :company_id and :company).
  def attributes
    @attributes ||= begin
      belongs_to_associations.map do |assoc|
        [assoc.foreign_key.to_sym, assoc.name]
      end.flatten
    end
  end

  private

  def belongs_to_associations
    @belongs_to_associations ||= begin
      @klass.reflect_on_all_associations.select do |assoc| 
        assoc.is_a?(ActiveRecord::Reflection::BelongsToReflection)
      end
    end
  end
end