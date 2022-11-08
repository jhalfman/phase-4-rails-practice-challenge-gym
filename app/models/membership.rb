class Membership < ApplicationRecord
    validate :one_membership_per_gym
    belongs_to :gym
    belongs_to :client

    validates :charge, presence: true
    
    def one_membership_per_gym
        if Membership.where("client_id == ? & gym_id == ?", client_id, gym_id).first
            errors.add(:client_id, "You already have a membership with that gym!")
        end
    end
end
