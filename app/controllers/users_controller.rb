class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = current_user
    @document = Document.new
    @documents = @user.documents

  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

    def destroy
    @user = User.find(params[:id])
    @user.destroy
  end

    private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :user_type, :institution, :email, :encrypted_password)
  end

end
