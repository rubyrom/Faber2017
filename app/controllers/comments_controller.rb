class CommentsController < ApplicationController

  def create
	  @contact=Contact.find(params[:contact_id])
    @contact.comments.create(comment_params)
    redirect_to contact_path(@contact)
  end

  def destroy
    @comment=Comment.find(params[:id])
    @comment.destroy
      redirect_to contacts_path
  end


  private
  def comment_params
  	params.require(:comment).permit(:author, :body)
  end

end
