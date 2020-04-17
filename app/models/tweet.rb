class Tweet < ApplicationRecord
    has_many :likes

    validates :content, presence: true
    belongs_to :user
end
