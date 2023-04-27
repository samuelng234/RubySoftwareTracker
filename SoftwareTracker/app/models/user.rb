class User < ApplicationRecord
    has_many :user_tools, dependent: :destroy

    validates :firstname, presence: true
    validates :lastname, presence: true

    scope :order_by_firstname, -> { order(:firstname) }
    scope :order_by_lastname, -> { order(:lastname) }
    scope :like_text, -> (search_text) { where("users.firstname LIKE ?", "%" + search_text + "%").or(User.where("users.lastname LIKE ?", "%" + search_text + "%")) }
end
