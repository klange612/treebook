class ProfilesController < ApplicationController
  def show
    @user = User.find_by_profile_name(params[:id])
    @statuses = @user.statuses.all
  end
end
