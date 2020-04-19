module TweetsHelper
    def render_with_hashtag(content)
        content.gsub(/#\w+/){|words| link_to words, "tweets/hashtags/#{words.delete('#')}"}.html_safe
    end
end
