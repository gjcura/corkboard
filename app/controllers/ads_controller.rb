class AdsController < ApplicationController
  before_action :signed_in_user

  def create
    @micropost = current_user.ads.build(ad_params)
    if @ad.save
      flash[:success] = "Ad created!"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end

  def destroy
  end
  
  def newad
  	@ad = current_user.ads.build if signed_in?
  end
  
  private

    def micropost_params
      params.require(:ad).permit(:content)
    end
end