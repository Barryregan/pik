class Theme < ApplicationRecord
    validates :name, presence: true 
    validates :description, presence: true, length: {minimum: 5, maximum: 750 }
    belongs_to :photographer
    validates :photographer_id, presence: true
    default_scope -> { order(updated_at: :desc)}
end