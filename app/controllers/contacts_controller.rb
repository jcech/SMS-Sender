class ContactsController < ApplicationController

  def index
    @contacts = current_user.contacts
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      current_user.contacts << @contact
      redirect_to contacts_path
    else
      render 'new'
    end
  end


private
  def contact_params
    params.require(:contact).permit(:name, :number)
  end
end
