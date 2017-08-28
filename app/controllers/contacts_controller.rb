class ContactsController < ApplicationController

  def new
  end

  def create
    @contact=Contact.new(contact_params)
    if @contact.valid?
      @contact.save
    else
      render action: 'new'
    end
  end

  def index
    @contacts=Contact.all
  end

  def show
    @contact=Contact.find(params[:id])
  end

  def destroy
  	@contact=Contact.find(params[:id])
  	@contact.destroy
  	  redirect_to contacts_path
  end

private
  def contact_params
    params.require(:contact).permit(:name, :phone, :email, :message)
  end

end
