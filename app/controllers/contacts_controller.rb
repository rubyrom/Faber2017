class ContactsController < ApplicationController

  layout "contacts"
  skip_before_action  :verify_authenticity_token

  before_action :authenticate_user!, except: [:create]

  def new
  end

  def create
    @contact=Contact.new(contact_params)
    if @contact.valid?
      @contact.save
      @message="Вы записаны!!!"
    else
      @message="Заполните все строки формы!"
    end

    redirect_back(fallback_location: "main")
  #  render action: 'about'

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
