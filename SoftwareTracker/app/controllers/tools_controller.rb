class ToolsController < ApplicationController
  def index
    if params[:search_text].nil?
      @tools = Tool.includes(:category).order_by_category_name.order_by_name
    else
      @tools = Tool.includes(:category).like_text(params[:search_text]).order_by_category_name.order_by_name
    end
  end
  
  def new
    @tool = Tool.new

    @categories = Category.all
  end
  
  def show
    @tool = Tool.find(params[:id])
  end
  
  def create
    tool = Tool.new(tool_params)

    if tool.save
      redirect_to tool
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  def edit
    @tool = Tool.find(params[:id])

    @categories = Category.all
  end

  def update
    tool = Tool.find(params[:id])
    
    if params[:tool][:category_id].empty?
      if tool.update(name: params[:tool][:name])
        tool.update_attribute(:category_id, nil)

        redirect_to tool
      else
        render :edit, status: :unprocessable_entity
      end
    else
      if tool.update(name: params[:tool][:name], category_id: params[:tool][:category_id])
        redirect_to tool
      else
        render :edit, status: :unprocessable_entity
      end
    end
  end

  def destroy
    tool = Tool.find(params[:id])
    tool.destroy

    redirect_to root_path, status: :see_other
  end

  private
    def tool_params
      params.require(:tool).permit(:name, :category_id)
    end
end
