class AdsController < ApplicationController
  before_action :signed_in_user

  def create
    @ad = current_user.ads.build(ad_params)
    if @ad.save
      flash[:success] = "Ad created!"
      redirect_to newad_path
    else
      render 'static_pages/home'
    end
  end

  def destroy
  end
  
  def new
  	@ad = current_user.ads.build if signed_in?
  end
  
  def edit
  end
  
  def show
  end
  
  
  private

    def ad_params
      params.require(:ad).permit(:content)
    end
end