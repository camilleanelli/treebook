class UserFriendshipsController < ApplicationController

  def new
    if params[:friend_id]
      @friend = User.find(params[:friend_id])
      @user_friendship = current_user.user_friendships.new(friend: @friend)
    else
      flash["error"] = "A friend required"
    end
  end

  def create
      if params[:friend_id]
        @friend = User.find(params[:friend_id])
        @user_friendship = current_user.user_friendships.new(friend: @friend)
        if @user_friendships.save
          redirect_to profile_path(@friend)
        end
      else
        flash[:error] = "friend required"
        redirect_to root_path
      end
  end

  private

  def user_friendship_params
    params.require(:user_friendship).permit(:friend_id, :user_id, :friend, :user)
  end
end
