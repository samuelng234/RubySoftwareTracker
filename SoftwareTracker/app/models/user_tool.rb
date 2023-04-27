class UserTool < ApplicationRecord
  belongs_to :user, optional: false
  belongs_to :tool, optional: false

  scope :with_user, ->(user_id) { where(user_id: user_id) }
  scope :group_tools, -> { includes(:tool).group(:tool_id) }
  scope :top_10, -> { order("count(user_tools.tool_id) DESC").limit(10) }
  scope :order_by_tool_categories, -> { order("categories.name ASC") }
  scope :order_by_tools, -> { order("tools.name ASC") }
end
