# app/controllers/users/sessions_controller.rb
class Users::SessionsController < Devise::SessionsController
  respond_to :json

  private

  def respond_with(resource, _opts = {})
    render json: {
      message: 'Logged in successfully',
      user: {
        id: resource.id,
        email: resource.email,
        roles: resource.roles.pluck(:name)
      }
    }, status: :ok
  end

  def respond_to_on_destroy
    if current_user
      render json: { message: "Logged out successfully" }, status: :ok
    else
      render json: { message: "User not logged in" }, status: :unauthorized
    end
  end
end
