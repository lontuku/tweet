class RenameTweetsTags < ActiveRecord::Migration[5.2]
  def change
    rename_table :tweets_tags, :tags_tweets
  end
end
