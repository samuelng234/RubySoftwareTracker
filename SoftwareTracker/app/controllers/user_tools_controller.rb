class UserToolsController < ApplicationController

  def create
    user = User.find(params[:user_id])
    user_tools = UserTool.new(user_id: params[:user_id], tool_id: params[:tool_id])

    if user_tools.save
      redirect_to request.referrer
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    user_tools = UserTool.find(params[:id])
    user_tools.destroy

    redirect_to request.referrer, status: :see_other
  end

  private
    def user_tool_params
      params.require(:user_tool).permit(:user_id, :tool_id)
    end
end
