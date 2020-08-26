class Admin::BaseController < ApplicationController
  before_action :authenticate_user!, only: [:new, :update, :destroy, :edit, :create]
  before_action :check_admin, only: [:new, :update, :destroy, :edit, :create]

  protected

  def check_admin
    redirect_to root_path, alert: "У вас нет доступа к этой странице" unless current_user.admin?
  end
end