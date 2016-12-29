class Game < ApplicationRecord
    belongs_to :user    # Association with User
    validates :user_id, presence: true
end
