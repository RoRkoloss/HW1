class PetitionsController < ApplicationController
	def index
    @petitions = Petition.last(10)
	end

	def new
  end

  def create
    @petition = Petition.new(petition_params)
    @petition.user_id = current_user.id
    @petition.save
      
    redirect_to root_url
  end

  def show
    @petition = Petition.find(params[:id])
  end

  private
    def petition_params
      params.require(:petition).permit(:title, :body)
    end
end
