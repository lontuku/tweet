class LikesController < ApplicationController
    before_action :authenticate_user!
    
    def create
        @tweet = Tweet.find(params[:tweet_id])
        @like = Like.create(tweet: @tweet, user: current_user, like: true)
        if @like.save
            redirect_to root_path, notice: 'Like!'
        else
            redirect_to root_path, alert: 'No fue posible hacer Like!'
        end
    end

    def destroy
        @tweet = Tweet.find(params[:tweet_id])
        @like = Like.find_by(tweet: @tweet, user: current_user, like: true)
        if !@like.blank?
            #(user_id: current_user.id, tweet_id: @tweet.id, like: true)
            @like.destroy
            redirect_to root_path, notice: 'Un like menos ):'
        else
            redirect_to root_path, alert: 'No fue posible borrar el like!'
        end
    end
end
