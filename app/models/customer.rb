class Customer < ApplicationRecord
  belongs_to :  Review
  belongs_to : order
  belongs_to :supplier
end
