class Contact < ActiveRecord::Base
  has_many :recipients
  belongs_to :user
  has_many :messages, through: :recipients
end
