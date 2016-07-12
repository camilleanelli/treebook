class ProfilesController < ApplicationController
  def show
    @user = User.find(params[:id])
    @statuses = @user.statuses.all
    unless @user
      render file: 'public/404', status: 404, formats: [:html]
    end
  end
end
