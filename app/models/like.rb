class Like<ApplicationRecord
    belongs_to :photographer
    belongs_to :theme
    
    validates_uniqueness_of :photographer, scope: :theme
end