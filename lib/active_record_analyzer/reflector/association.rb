class ActiveRecordAnalyzer::Reflector::Association
  def initialize(klass)
    @klass = klass
  end

  def has_attribute?(attribute)
    attributes.include?(attribute.to_sym)
  end

  # This returns foreign_keys and association names (ex: :company_id and :company).
  def attributes
    @attributes ||= begin
      @klass.reflect_on_all_associations.map do |assoc|
        [assoc.foreign_key.to_sym, assoc.name]
      end.flatten
    end
  end
end