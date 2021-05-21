class Blogger < ApplicationRecord
    has_many :posts
    has_many :destinations, through: :posts 

    validates :name, uniqueness: true
    validates :age, numericality: { greater_than: 0 }
    validates :bio, length: {minimum: 31} 

    def total_likes
        posts.sum(:likes)
    end

    def most_liked_post
        posts.max_by{ |post| post.likes }
    end

    def most_liked_post_title
        if most_liked_post.title
            most_liked_post.title 
        end
    end

    # def most_written_about_destinations
    #     Post.group(:destination_id).group(:blogger_id).where(:blogger_id = self.id).first(5)
    # end {[1, 1]=>2, [17, 1]=>1, [19, 1]=>1, [21, 1]=>1, [24, 1]=>1, [26, 1]=>1} 
end
