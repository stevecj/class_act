module ClassAct

  module ImplementsRole
    def self.included(other)
      other.extend ClassBehavior
    end

    module ClassBehavior
      def implement_role(role_module, &block)
        class_eval &block
      end
    end

  end


end
