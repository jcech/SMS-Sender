class Contact < ActiveRecord::Base
  has_many :recipients
  has_many :messages, through: :recipients
end
