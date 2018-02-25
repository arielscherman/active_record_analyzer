require "spec_helper"

describe ActiveRecordAnalyzer::Reflector do
  subject(:reflector) { ActiveRecordAnalyzer::Reflector.new(User) }

  describe "#reflect" do
    context "when attribute is not in the model" do
      it "raises an error" do
        expect { reflector.reflect(:invalid_attribute) }.to raise_error "There is no invalid_attribute in the class User"
      end
    end

    context "when attribute is a normal attribute" do
      it "returns an Attribute::Simple" do
        binding.pry
        expect(reflector.reflect(:name)).to be_a ActiveRecordAnalyzer::Attribute::Simple
      end
    end

    context "when attribute is a has_many"

    context "when awttribute is a belongs_to"
  end
end