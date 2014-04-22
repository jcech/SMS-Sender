class Message < ActiveRecord::Base
  belongs_to :user
  has_many :recipients
  has_many :contacts, through: :recipients
  accepts_nested_attributes_for :recipients

  def text_it
    recipients.each do |recipient|

      response = RestClient::Request.new(
        :method => :post,
        :url => 'https://api.twilio.com/2010-04-01/Accounts/ACe14a24973eb88a9c1d231657a2550d0b/Messages.json',
        :user => 'ACe14a24973eb88a9c1d231657a2550d0b',
        :password => 'd463b5113424c2885a5803f21e1662cd',
        :payload => { :Body => body,
                      :To => Contact.find(recipient.contact_id).number,
                      :From => "3212148535"}
      ).execute

    end

    self.save
  end
end
