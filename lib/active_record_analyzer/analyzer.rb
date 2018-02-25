class ActiveRecordAnalyzer::Analyzer
  def initialize(klass)
    ActiveRecordAnalyzer::Reflector.new(klass)
  end
end