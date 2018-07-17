class Message < ApplicationRecord
    belongs_to :photographer
    validates :content, presence: true
    validates :photographer_id, presence: true
    
    
    def self.most_recent
       order(:created_at).last(20)
    end
   
    
end