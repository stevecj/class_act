module ClassAct

  module ImplementsRole
    def self.included(other)
      other.extend ClassBehavior
    end

    module ClassBehavior
      def implement_role(role_module, &block)
        include role_module unless include?(role_module)
        implementation_module = ca_role_implementation_modules[role_module] ||= begin
          i_mod = Module.new
          include i_mod
          i_mod
        end
        implementation_module.module_eval &block
        extra_methods =
          implementation_module. public_instance_methods(:false) -
          role_module.           public_instance_methods(:false)
        unless extra_methods.empty?
          extra_methods_text = extra_methods.map{ |m| "##{m}" }.sort.join(', ')
          raise ClassAct::InvalidMethodDefinitionError,
            "The following methods were defined as implementations of methods that are not defined by #{role_module}: #{extra_methods_text}."
        end
      end

      private

      def ca_role_implementation_modules
        @ca_role_implementation_modules ||= {}
      end
    end

  end


end
