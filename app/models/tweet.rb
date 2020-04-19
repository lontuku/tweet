class Tweet < ApplicationRecord
    has_many :likes
    has_many :users, through: :likes
    validates :content, presence: true
    belongs_to :user
    has_and_belongs_to_many :tags 


#scope :tweets_for_me, ->  {includes(:current_user).where("user_id LIKE ?")}
  after_create do
    tweet = Tweet.find_by(id: self.id)
    if hashtag = self.content.scan(/#\w+/) != blank?
      hashtag = self.content.scan(/#\w+/)
      hashtag.uniq.map do |h|
        tag = Tag.find_or_create_by(name: h.downcase.delete('#'))
        tweet.tags << tag
      end 
    end
  end

  before_update do 
    tweet = Tweet.find_by(id:self.id)
    tweet.tags.clear
    if hashtag = self.content.scan(/#\w+/) != blank?
      hashtag = self.content.scan(/#\w+/)
      hashtag.uniq.map do |h|
        tag = Tag.find_or_create_by(name: h.downcase.delete('#'))
        tweet.tags << tag
      end 
    end
  end
  
end