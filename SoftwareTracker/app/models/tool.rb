class Tool < ApplicationRecord
    has_many :user_tools, dependent: :destroy

    belongs_to :category

    validates :name, presence: true

    scope :order_by_name, -> { order(:name) }
    scope :order_by_category_name, -> { order("categories.name") }
    scope :like_text, -> (search_text) { where("tools.name LIKE ?", "%" + search_text + "%") }
end
