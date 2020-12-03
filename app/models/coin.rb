class Coin < ApplicationRecord
    belongs_to :mining_type #, optional: true
    #conversa com o MiningTypes
end
