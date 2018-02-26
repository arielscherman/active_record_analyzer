class ActiveRecordAnalyzer::Reflector::Base
  def initialize(klass)
    @klass = klass
  end

  def has_attribute?(attribute)
    attributes.include?(attribute.to_sym)
  end

  # Return all class attributes the reflector matches.
  #
  def attributes
    fail "You need override the attributes method"
  end

  # Return an attribute type to define the type.
  #
  def attribute_type
    fail "You need override the attribute_type method"
  end
end