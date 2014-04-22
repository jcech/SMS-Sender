class Message < ActiveRecord::Base



  def text_it
    response = RestClient::Request.new(
      :method => :post,
      :url => 'https://api.twilio.com/2010-04-01/Accounts/ACe14a24973eb88a9c1d231657a2550d0b/Messages.json',
      :user => 'ACe14a24973eb88a9c1d231657a2550d0b',
      :password => 'd463b5113424c2885a5803f21e1662cd',
      :payload => { :Body => self.body,
                    :To => self.number,
                    :From => "3212148535"}
    ).execute
  rescue Exception => e
    print "\n\n\n"
    puts e
    false
  end
end
