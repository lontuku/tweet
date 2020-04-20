module TweetsHelper
    def render_with_hashtag(content)
        content.gsub(/#\w+/){|words| link_to words, root_path+"tweets/hashtags/#{words.delete('#')}"}.html_safe
        # new_url = Rails.root.join('tweets','hashtags','words')
        # ({|new_url| link_to new_url, "hola/hola"}.html_safe)
    end
end
