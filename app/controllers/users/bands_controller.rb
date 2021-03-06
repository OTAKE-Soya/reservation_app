class Users::BandsController < ApplicationController
  def show
    @band = Band.find(params[:id])
  end

  def edit
    @band = Band.find(params[:id])
    @users = @users = User.where.not(id: current_user.id)
  end
  
  def update
    band = Band.find(params[:id])
    band.update(band_params)
    redirect_to bands_path
  end

  def index
    @bands = Band.all
  end

  def new
    @band = Band.new
    6.times {@band.band_members.build}
    @users = User.where.not(id: current_user.id)
  end
  
  def create
    band = Band.new(band_params)
    band.band_members = band.band_members.reject {|band_member| !band_member.user_id}
    band.band_members.build(user_id: current_user.id)
    if band.save
      redirect_to bands_path
    else
      redirect_to new_band_path
    end
  end
  
  def destroy
    band = Band.find(params[:id])
    band.delete
    redirect_to bands_path
  end
  
  private
  def band_params
    params.require(:band).permit(:name, band_members_attributes: [:user_id])
  end
end