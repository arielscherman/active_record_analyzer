class ActiveRecordAnalyzer::Reflector::HasMany
  def initialize(klass)
    @klass = klass
  end

  def has_attribute?(attribute)
    attributes.include?(attribute.to_sym)
  end

  def attribute_type
    @attribute_type ||= ActiveRecordAnalyzer::Attribute::HasMany
  end

  # This returns foreign_keys and association names (ex: :company_id and :company).
  def attributes
    @attributes ||= has_many_associations.map { |assoc| assoc.name }
  end

  private

  def has_many_associations
    @belongs_to_associations ||= begin
      @klass.reflect_on_all_associations.select do |assoc| 
        assoc.is_a?(ActiveRecord::Reflection::HasManyReflection)
      end
    end
  end
end