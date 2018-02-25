require "spec_helper"

describe ActiveRecordAnalyzer::Reflector do
  subject(:reflector) { ActiveRecordAnalyzer::Reflector.new(User) }

  describe "#reflect" do
    context "when no reflector has the given attribute" do
      it "returns nothing" do
        expect(reflector.reflect(:non_existing_attribute)).to eq nil
      end
    end

    context "when a reflector does have the given attribute" do
      class FooReflector
        def has_attribute?(_)
          true
        end

        def attribute_type
          :some_type
        end
      end
  
      before { allow(reflector).to receive(:reflectors).and_return([FooReflector.new]) }

      it "returns the attribute type" do
        expect(reflector.reflect(:some_attribute)).to eq :some_type
      end
    end
  end
end