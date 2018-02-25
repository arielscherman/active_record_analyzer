class ActiveRecordAnalyzer::Reflector
  REFLECTORS = %i(belongs_to has_many simple).freeze

  def initialize(klass)
    @klass = klass
  end

  # Asks every reflector if they find the given attribute in the class,
  # and returns the attribute type (if any matched).
  #
  def reflect(attribute)
    reflectors.find do |reflector|
      reflector.has_attribute?(attribute)
    end.try(:attribute_type)
  end

  def reflectors
    REFLECTORS.map { |reflector_name| find_reflector(reflector_name).new(@klass) }
  end

  private

  def find_reflector(reflector_name)
    "ActiveRecordAnalyzer::Reflector::#{reflector_name.to_s.classify}".constantize
  end
end