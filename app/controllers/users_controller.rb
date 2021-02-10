class UsersController < ApplicationController
  before_action :set_user, except: %i[index new create]

  def index
    @users = policy_scope(User)
    authorize @users
  end

  def show; end

  def new
    @user = User.new
    authorize @user
  end

  def create
    @user = User.new(user_params)
    authorize @user

    if @user.save
      redirect_to user_path(@user), notice: 'Created successfully.'
    else
      render :new
    end
  end

  def edit; end

  def update
    @user.update(user_params)
    redirect_to user_path(@user), notice: 'Updated successfully.'
  end

  def destroy
    @user.destroy
    redirect_to users_path, notice: 'Deleted successfully.'
  end

  private

    def set_user
      @user = User.find(params[:id])
      authorize @user
    end

    def user_params
      params.require(:user).permit(policy(User).permitted_attributes)
    end
end
