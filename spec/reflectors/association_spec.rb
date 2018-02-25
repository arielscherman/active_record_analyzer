require "spec_helper"

describe ActiveRecordAnalyzer::Reflector::Association do
  subject(:reflector) { ActiveRecordAnalyzer::Reflector::Association.new(User) }

  describe "#has_attribute?" do
    context "when attribute is not in the model" do
      it "returns false" do
        expect(reflector.has_attribute?(:invalid_attribute)).to be_falsey
      end
    end

    context "when attribute is a normal attribute" do
      it "returns false" do
        expect(reflector.has_attribute?(:name)).to be_falsey
      end
    end

    context "when attribute is a has_many" do
      it "returns true" do
        expect(reflector.has_attribute?(:pictures)).to be_truthy
      end
    end

    context "when attribute is a belongs_to" do
      it "returns true" do
        expect(reflector.has_attribute?(:company)).to    be_truthy
        expect(reflector.has_attribute?(:company_id)).to be_truthy
      end
    end
  end
end