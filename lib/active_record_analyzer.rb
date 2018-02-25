require "active_record_analyzer/version"
require "active_record_analyzer/attribute"
require "active_record_analyzer/attribute/simple"
require "active_record_analyzer/reflector"
require "active_record_analyzer/reflector/association"
require "active_record_analyzer/reflector/simple"


module ActiveRecordAnalyzer
  def initialize(klass)
    ActiveRecordAnalyzer::Reflector.new(klass)
  end
end
