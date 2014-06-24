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
        def foo ; :role_foo ; end
        def bar ; :role_bar ; end
        def baz ; :role_baz ; end
        def bat ; :role_bat ; end
      end }

      context "given a block that defines instance methods overriding some of those of the given module" do
        before do
          role_mod = role_module
          subject.class_eval do
            implement_role role_mod do
              def foo ; :implementation_foo ; end
              def baz ; :implementation_baz ; end
            end
          end
        end

        let(:instance) { subject.new }

        it "adds the non-overridden role module instance methods to the class" do
          expect( instance.bar ).to eq( :role_bar )
          expect( instance.bat ).to eq( :role_bat )
        end

        it "overides the role instance methods with defined implementation methods" do
          expect( instance.foo ).to eq( :implementation_foo )
          expect( instance.baz ).to eq( :implementation_baz )
        end
      end

      context "given a block that defines some instance methods not defined by the given module" do
        it "raises a ClassAct::InvalidMethodDefinitionError"
      end

    end
  end

end
