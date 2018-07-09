class Tool < ApplicationRecord
    validates :name, presence: true, length: { minimum: 3, maximum: 25}
    validates_uniqueness_of :name
    has_many :theme_tools
    has_many :themes, through: :theme_tools
end