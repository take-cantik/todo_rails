class Api::SessionsController < Devise::SessionsController
  def destroy
    signed_out = (Devise.sign_out_all_scopes ? signed_out : signed_out(response_name))
    render json: { success: true }
  end
end