class Membership < ApplicationRecord
    validates :gym_id, presence: true
    validates :client_id, presence: true
    validates :charge, presence: true
    validates :client, uniqueness: { scope: :gym }
    belongs_to :client
    belongs_to :gym
end
