class Drink < ApplicationRecord
  belongs_to :mixer
  belongs_to :alcohol
end
