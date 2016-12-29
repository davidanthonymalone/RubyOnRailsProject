class Game < ApplicationRecord
    belongs_to :user    # Association with User
    validates :user_id, presence: true
    
     has_attached_file :image
    do_not_validate_attachment_file_type :image
    
end
