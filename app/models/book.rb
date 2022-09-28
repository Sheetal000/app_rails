class Book < ApplicationRecord
  belongs_to :supplier
  belongs_to :author

  has_many :reviews
  
  ## scopes
  scope :in_print, -> { where(out_of_print: false) }

  # default_scope { where(out_of_print: false) }
  scope :out_of_print, -> { where(out_of_print: true) }

  scope :recent, -> { where('year_published >= ?', Date.current.year - 50 )}
  scope :old, -> { where('year_published < ?', Date.current.year - 50 )}


  # scope :out_of_print, -> { where(out_of_print: true) }

  # def self.costs_more_than(amount)
  #   where("price > ?", amount)
  # end

end
