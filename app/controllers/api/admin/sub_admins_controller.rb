# app/controllers/api/admin/sub_admins_controller.rb
class Api::Admin::SubAdminsController < ApplicationController
  before_action :authorize_admin

  def create
    user = User.new(sub_admin_params)
    if user.save
      user.add_role(:sub_admin)
      render json: { message: 'Sub Admin created successfully' }
    else
      render json: user.errors, status: 422
    end
  end

  private

  def authorize_admin
    render json: { error: 'Unauthorized' }, status: 403 unless current_user.has_role?(:admin)
  end

  def sub_admin_params
    params.permit(:name, :email, :password, :contact_number, :image)
  end
end
