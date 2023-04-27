class Category < ApplicationRecord
    has_many :tools, dependent: :destroy

    scope :not_assigned_to_tool, -> (tool_id) { where.not(id: Tool.where(id: tool_id).pluck(:category_id)) }
    scope :like_text, -> (search_text) { where("name LIKE ?", "%" + search_text + "%") }
    scope :sort_by_name, -> { order(:name) }
end
