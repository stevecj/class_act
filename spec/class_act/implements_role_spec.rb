require 'spec_helper'

describe ClassAct::ImplementsRole do
  describe "an including class" do

    describe '::implement_role' do
      context "given a block that defines instance methods overriding those of the given module" do
        it "adds the instance methods to the class"
      end

      context "given a block that defines some instance methods not overriding those of the given module" do
        it "raises a ClassAct::InvalidMethodDefinitionError"
      end

    end
  end

end
