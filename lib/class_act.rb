require "class_act/version"
require 'class_act/implements_role'

module ClassAct

  class ClassAct::Error              < StandardError   ; end
  class InvalidRoleClassError        < ClassAct::Error ; end
  class InvalidMethodDefinitionError < ClassAct::Error ; end

end
