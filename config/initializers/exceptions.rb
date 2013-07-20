#
# custom exceptions of this project
#
# @author snow.hellsing@gmail.com
#

class Exception
  def uinf
    {
      error: self.class.name,
      message: self.message
    }
  end

  def http_code
    500
  end
end

class OperationNotAllowed < RuntimeError
  def http_code
    422
  end
end

module ActionController
  #
  # Presenting http 403 not_allowed.
  # ActionController will rescue from this and display 403 err page
  #
  # @!attribute [rw] message
  #   @return [String] explain why the visitor is forbidden
  #
  # @!method new(message)
  #   @param [String] (see #message)
  class Forbidden < ActionControllerError
    def http_code
      403
    end
  end
end
