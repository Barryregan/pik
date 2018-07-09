class Comment < ApplicationRecord
    
    validates :description, presence: true, length: { minimum: 4, maximum: 140}
    belongs_to :photographer
    belongs_to :theme
    validates :photographer_id, presence: true
    validates :theme_id, presence: true
    default_scope -> {order(updated_at: :desc)}
end