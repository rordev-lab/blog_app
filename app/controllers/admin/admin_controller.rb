class Admin::AdminController < ApplicationController
  layout 'admin'

  before_action :authenticate_user!
  before_action :admin_access!
end
