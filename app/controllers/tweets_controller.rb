class TweetsController < ApplicationController
  before_action :authenticate_user!, except: [:index] 
  
  def index
    @tweets =  Tweet.order(:id).page params[:page]
    @tweet = Tweet.new
    #@user = current_user
    #User.find(params[:user_id]).id
  end

  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.user = current_user
    respond_to do |f|
      if @tweet.save
        f.html {redirect_to root_path, notice: 'El Tweet ha sido creado.'}
      else
        f.html {redirect_to root_path, notice: 'El Tweet no pudo ser guardado.'}
      end 
    end
  end
  
  def retweet
    @tweet = Tweet.find(params[:id])
    redirect_to root_path, alert: 'EL retweet no pudo ser realizado.' and return if @tweet.user == current_user
    ret = Tweet.new(content: @tweet.content)
    ret.user = current_user
    if ret.save
      @tweet.update(retweets: @tweet.retweets += 1)
      redirect_to root_path, notice: 'El retweet se ha realizado con éxito'
    else 
      redirect_to root_path, notice: 'No se ha podido realizar.'
    end

  end

  def show
    @tweet = Tweet.find(params[:id])
    @user_likes = Like.all.where(tweet_id: @tweet).pluck('user_id')
  end

  private
  def set_tweet
    @tweet = Tweet.find(params[:id])
  end

  def tweet_params
    params.require(:tweet).permit(:content)
  end

end
