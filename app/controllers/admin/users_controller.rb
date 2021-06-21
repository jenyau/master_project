class Admin::UsersController < Admin::BaseController

  skip_before_action :verify_authenticity_token
  before_action :set_user, only: [:show, :edit, :update, :destroy, :update_mailing_status]

  def index
    index_users_list
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to [:admin, @user]
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to [:admin, @user]
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to admin_users_path
  end

  def update_mailing_status
    @user.update(mailing_status: params[:mailing_status])
    index_users_list

    respond_to do |format|
      format.html { render template: 'admin/users/update_mailing_status', locals: { users: @users } }
    end
  end

  private

  def index_users_list
    @users = User.order('mailing_status ASC, email ASC')
  end


  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :id, :email, :mailing_status)
  end

end