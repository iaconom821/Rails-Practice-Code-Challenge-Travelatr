class Post < ApplicationRecord
    belongs_to :blogger
    belongs_to :destination

    validates :title, presence: true
    validates :content, length: { minimum: 101 }

    def increase_likes
        self.likes += 1
        self
    end
end
