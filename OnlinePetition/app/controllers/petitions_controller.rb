class PetitionsController < ApplicationController
	def index
    @petitions = Petition.all.order('created_at DESC')
	end

	def new
  end

  def create
    @petition = Petition.new(petition_params)
    @petition.save
      
    redirect_to @petition
  end

  def show
    @petition = Petition.find(params[:id])
  end

  private
    def petition_params
      params.require(:petition).permit(:title, :body)
    end
end
