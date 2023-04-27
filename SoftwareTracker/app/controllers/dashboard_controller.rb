class DashboardController < ApplicationController
  def index
    @user_tools = UserTool.group_tools.top_10
  end
end