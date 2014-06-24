require 'spec_helper'

describe ClassAct::ImplementsRole do
  subject(:described_module) { ClassAct::ImplementsRole }

  describe "an including class" do
    subject {
      mod = described_module
      Class.new do ; include mod ; end
    }

    describe '::implement_role' do
      let(:role_module) { Module.new do
        def foo ; end
        def bar ; end
        def baz ; end
      end }

      context "given a block that defines instance methods overriding some of those of the given module" do
        before do
          role_mod = role_module
          subject.class_eval do
            implement_role role_mod do
              def foo ; end
              def baz ; end
            end
          end
        end

        it "adds the instance methods to the class" do
          expect( subject.method_defined?(:foo) ).to eq( true )
          expect( subject.method_defined?(:baz) ).to eq( true )
        end
      end

      context "given a block that defines some instance methods not defined by the given module" do
        it "raises a ClassAct::InvalidMethodDefinitionError"
      end

    end
  end

end
