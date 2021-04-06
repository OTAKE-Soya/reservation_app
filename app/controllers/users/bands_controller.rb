class Users::BandsController < ApplicationController
  def show
    @band = Band.find(params[:id])
  end

  def edit
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
    5.times do
      band.band_members.each do |band_member|
        p band_member
        unless band_member.user_id
          band.band_members.delete(band_member)
        end
      end
    end
    
    p band.band_members
    # band_member.destroy
    band.save
  end
  
  private
  def band_params
    params.require(:band).permit(:name, band_members_attributes: [:user_id])
  end
end