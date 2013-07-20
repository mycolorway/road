class SessionsController < Devise::SessionsController
  # TODO: faking implementation
  def create
    user = User.find(1)

    sign_in :users, User.find(1)

    respond_with user, location: after_sign_in_path_for(user)
  end
end

