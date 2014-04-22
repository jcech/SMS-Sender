class Message < ActiveRecord::Base
  validates :body, presence: :true, length: {in: 1..155 }
  validates :number, presence: :true, length: {is: 10}

end
