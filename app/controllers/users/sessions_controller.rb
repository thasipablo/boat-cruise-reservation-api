class Users::SessionsController < Devise::SessionsController
  include RackSessionsFix
  respond_to :json

  # Permit the 'name' parameter
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def respond_with(resource, _opts = {})
    render json: {
      status: { code: 200, message: 'Logged in successfully.' },
      data: {
        id: resource.id,
        name: resource.name,
        email: resource.email,
        created_at: resource.created_at,
        created_date: resource.created_at&.strftime('%m/%d/%Y')
      }
    }, status: :ok
  end

  def respond_to_on_destroy
    if current_user
      render json: {
        status: 200,
        message: "Logged out successfully"
      }, status: :ok
    else
      render json: {
        status: 401,
        message: "Couldn't find an active session."
      }, status: :unauthorized
    end
  end
  private
  def sign_in_params
    params.require(:user).permit(:email, :password, :name)
  end
  protected

  # Permit the 'name' parameter
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
