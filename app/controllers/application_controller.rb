class ApplicationController < ActionController::API
    include Pundit
    before_action :authenticate_user!
end
