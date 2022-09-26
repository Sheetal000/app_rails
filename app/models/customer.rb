class Customer < ApplicationRecord
  Customer.find_each do |customer|
    NewsMailer.weekly(customer).deliver_now
  end  
end
