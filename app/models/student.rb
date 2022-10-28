class Student < ApplicationRecord
  validates :stu_name,presence: true
  validates :stu_surname,confirmation:true length: { is: 5 }, allow_blank: true
end
