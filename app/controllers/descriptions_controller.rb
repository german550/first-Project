class DescriptionsController < ApplicationController

  def index
    @profession = Profession.find(params[:profession_id])
    @descriptions = @profession.descriptions
    @descriptions = Description.all.order("created_at DESC")

  end
  def show
    @description = Description.find(params[:id])
    
  end
  def new
    @description = Description.new
    @profession = Profession.find(params[:profession_id])
  end
  def create
    @description = Description.new(description_params)
    @description.user_id = current_user.id
    @description.profession_id = params[:profession_id]
    if @description.save
      flash[:notice] = "Post created!"
      redirect_to "/professions/#{params[:profession_id]}/descriptions/#{params[:description_id]}"
    else
    redirect_back(fallback_location: root_path)
    flash[:alert] = "Post creation failed"
    end
  end
  def update
    @description = Description.find(params[:id])
      if current_user == @description.user
        @description.update(post_params)
        redirect_to @description
        flash[:notice] = "Updatesuccessful!"
      else
        redirect_back(fallback_location: root_path)
        flash[:alert] = "Not authorized to update"
      end
  end
  def destroy
    description = Description.find(params[:id])
    if current_user == description.user
      description.destroy
      redirect_to "/professions/#{params[:profession_id]}/descriptions/"
      flash[:notice] = "post destroyed"
    else
      redirect_back(fallback_location: root_path)
      flash[:alert] = "Not authorized to delete post"
    end
  end
  def edit
      @description = Description.find(params[:id])
      if current_user !=@description.user
        sign_out current_user
        flash[:alert] = "Unauthorized request"
    end
  end
    def update
      @description = Description.find(params[:id])
      if current_user == @description.user
        @description.update(post_params)
        redirect_to @description
        flash[:notice] = "Updatesuccessful!"
      else
        redirect_back(fallback_location: root_path)
        flash[:alert] = "Not authorized to update"
      end
    end
  private
  def description_params
    params.require(:description).permit(:description, :image)
  end
end
