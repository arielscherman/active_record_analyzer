class ActiveRecordAnalyzer::Reflector::BelongsTo < ActiveRecordAnalyzer::Reflector::Base
  # This returns foreign_keys and association names (ex: :company_id and :company).
  #
  def attributes
    @attributes ||= begin
      belongs_to_associations.map do |assoc|
        [assoc.foreign_key.to_sym, assoc.name]
      end.flatten
    end
  end

  def attribute_type
    @attribute_type ||= ActiveRecordAnalyzer::Attribute::BelongsTo
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