# frozen_string_literal: true

module Admin
  class AdminController < ApplicationController
    layout 'admin'

    before_action :authenticate_user!
    before_action :admin_access!
  end
end
