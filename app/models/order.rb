class Order < ApplicationRecord
  belongs_to :customer
  # scope :created_before, ->(time) { where("created_at < ?", time) if time.present? }
  enum :status, [:shipped, :being_packaged, :complete, :cancelled]

end
