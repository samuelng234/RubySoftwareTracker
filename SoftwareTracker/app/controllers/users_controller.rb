class UsersController < ApplicationController
  def index
    if params[:search_text].nil?
      @users = User.order_by_firstname.order_by_lastname
    else
      @users = User.like_text(params[:search_text]).order_by_firstname.order_by_lastname
    end
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    user = User.new(user_params)

    if user.save
      redirect_to user
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])

    if user.update(user_params)
      redirect_to user
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy

    redirect_to root_path, status: :see_other
  end

  def manage_tools
    @unassigned_tools = Tool.includes(:category).where.not(id: UserTool.with_user(params[:user_id]).pluck(:tool_id)).order_by_category_name.order_by_name
    @assigned_tools = UserTool.includes(:tool).with_user(params[:user_id]).order_by_tools
  end

  private
    def user_params
      params.require(:user).permit(:firstname, :lastname)
    end
end
