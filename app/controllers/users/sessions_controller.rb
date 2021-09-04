class Users::SessionsController < Devise::SessionsController
  def destroy
    super
  end

  def after_sign_in_path(resource)
    root_path
  end

  def after_sign_out_path(resource)
    root_path
  end
end
