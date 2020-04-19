class FollowsController < ApplicationController
    before_action :find_followed
    skip_before_action :verify_authenticity_token, only: [:create, :update, :destroy]


  def create
    @user = current_user
    # if already_followed?
      # flash[:notice] = "You can't follow more than once"
    # else
      @user.follows.create(user_id: @user.id, follow_id: @followed.id)
    # end
    #redirect_to root_path
    redirect_to user_path(@followed.tweets.last.id)
  end


  def destroy
    # @user = User.find(params[:user_id])
    # if !(already_followed?)
    #   flash[:notice] = "Cannot unfollow"
    # else
      Follow.all.where(user_id: current_user.id, follow_id: @followed.id).destroy_all
    # end
    #redirect_to root_path
    redirect_to user_path(@followed.tweets.last.id)
  end

  private

    def find_followed
       @followed = User.find(params[:user_id])
    end

    def already_followed?
      Follow.all.where(user_id: current_user.id, follow_id: @followed.id).exists?
    end

end

