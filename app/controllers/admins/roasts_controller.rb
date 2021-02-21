class Admins::RoastsController < ApplicationController

  def index
    @roasts = Roast.all
    @roast = Roast.new
  end

  def create
    @roast = Roast.new(roast_params)
    @roast.save
    redirect_to admins_roasts_path
  end

  def destroy
    @roast = Roast.find(params[:id])
    @roast.delete
    redirect_to admins_roasts_path
  end

  private

  def roast_params
    params.require(:roast).permit(:name)
  end

end
