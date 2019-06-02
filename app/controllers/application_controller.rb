class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token

  attr_reader :current_user

  before_action :authenticate_user

  def authenticate_user
    @current_user = warden.authenticate(scope: :user)
  end

  def current_user
    @current_user ||= User.new
  end
end
