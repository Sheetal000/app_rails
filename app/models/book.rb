class Book < ApplicationRecord
  belongs_to :supplier
  belongs_to :author
  scope :out_of_print, -> { where(out_of_print: true) }

  def self.costs_more_than(amount)
    where("price > ?", amount)
  end

end
