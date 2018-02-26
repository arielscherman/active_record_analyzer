class ActiveRecordAnalyzer::Reflector::HasMany < ActiveRecordAnalyzer::Reflector::Base
  # This returns foreign_keys and association names (ex: :company_id and :company).
  #
  def attributes
    @attributes ||= has_many_associations.map { |assoc| assoc.name }
  end

  def attribute_type
    @attribute_type ||= ActiveRecordAnalyzer::Attribute::HasMany
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