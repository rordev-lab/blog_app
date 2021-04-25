# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit

  add_flash_types :info, :error, :warning
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def after_sign_in_path_for(_resource)
    if current_user.admin?
      admin_dashboard_path
    else
      root_path
    end
  end

  protected

  def admin_access!
    redirect_to root_path unless current_user.try(:admin?)
  end

  def non_admin_access!
    redirect_to admin_dashboard_path if current_user.try(:admin?)
  end

  private

  def user_not_authorized
    flash[:alert] = 'You are not authorized to perform this action.'
    redirect_to(request.referrer || root_path)
  end
end
