class Admin::BaseController < ApplicationController
  before_action :authenticate_user!, only: [:new, :update, :destroy, :edit, :create]
  before_action :check_admin

    layout "admin"

  protected

  def check_admin
    redirect_to root_path, alert: "У вас нет доступа к этой странице" unless current_user.admin?
  end
  def after_sign_in_path_for(resource)
    if current_user.admin?
      redirect_to admin_products_path
    else
      redirect_to root_path
    end
  end

end
