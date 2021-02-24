class Admins::TastesController < ApplicationController

  def index
    @tastes = Taste.all
    @taste = Taste.new
  end

  def create
    @taste = Taste.new(taste_params)
    @taste.save
    redirect_to admins_tastes_path
  end

  def destroy
    @taste = Taste.find(params[:id])
    @taste.delete
    redirect_to admins_tastes_path
  end

  private

  def taste_params
    params.require(:taste).permit(:name)
  end
end
