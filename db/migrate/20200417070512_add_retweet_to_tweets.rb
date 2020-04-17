class AddRetweetToTweets < ActiveRecord::Migration[5.2]
  def change
    add_column :tweets, :retweets, :integer, default: 0
  end
end
