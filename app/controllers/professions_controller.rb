class ProfessionsController < ApplicationController

  def index
      @professions = Profession.all
      @user = current_user
      @list = [["carpenter", "carpenter"],["hornamenter", "hornamenter"],["gardener","gardener"],["handyman","handyman"],["plomber","plomber"],["electricist","electricist"],["locksmith","locksmith"]]
    end
    def new
      @profession = Profession.new
    end
    def create
      current_user
      @profession = Profession.new(profession_params)
      @profession.user_id = current_user.id
      if @profession.save
        redirect_to professions_path
        flash[:notice] = "Profession added!"
    else
      redirect_back(fallback_location: root_path)
      flash[:alert] = "Profession creation failed"
    end
    end
    def show
    @profession = Profession.find(params[:id])
    end
    def destroy
      profession = Profession.find(params[:id])
      if current_user == profession.user
        profession.destroy
        redirect_to "/professions/"
        flash[:notice] = "profession destroyed"
      else
        redirect_back(fallback_location)
        root_path
        flash[:alert] = "Not authorized to delete post"
      end
    end
      def edit
        @profession = Profession.find(params[:id])
        if current_user !=@profession.user
          sign_out current_user
          flash[:alert] = "Unauthorized request"
      end
    end
      def update
        @profession = Profession.find(params[:id])
        if current_user == @profession.user
          @profession.update(post_params)
          redirect_to @profession
          flash[:notice] = "Updatesuccessful!"
        else
          redirect_back(fallback_location: root_path)
          flash[:alert] = "Not authorized to update"
        end
      end
    private
    def profession_params
      params.require(:profession).permit(:name)
    end
  end
