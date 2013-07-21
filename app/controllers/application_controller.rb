class ApplicationController < ActionController::Base
  protect_from_forgery

  def require_params(*keys)
    keys.map do |key|
      raise OperationNotAllowed.new("missing required param: #{key.to_s}") \
        unless params.key? key
    end
  end

  def fake_auth!
    @current_user = User.find 1
  end

  def current_user
    @current_user
  end
end
