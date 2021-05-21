class Destination < ApplicationRecord
    has_many :posts
    has_many :bloggers, through: :posts

    def recent_posts
        posts.order(created_at: "DESC").first(5)
    end

    def most_liked_post
        posts.max_by{ |post| post.likes }
    end

    def avg_blogger_age
        bloggers.uniq{|blogger|blogger.id}.sum{|blogger|blogger.age}/bloggers.uniq{|blogger|blogger.id}.count
    end
end
