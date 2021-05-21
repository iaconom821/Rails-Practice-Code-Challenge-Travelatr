class PostsController < ApplicationController
    def index
        @posts = Post.all 
    end

    def show
        @post = Post.find(params[:id])
    end

    def create
        @new_post = Post.new(post_params)
        
        if @new_post.valid?
            @new_post.save

            redirect_to post_path(@new_post)
        else  
            redirect_to new_post_path
        end
    end

    def new
        @post = Post.new
        @blogger = Blogger.all 
        @destination = Destination.all
    end

    def edit
        @post = Post.find(params[:id])
        @blogger = Blogger.all 
        @destination = Destination.all
    end

    def update
        @update_post = Post.find(params[:id])
        @update_post.assign_attributes(post_params)
        
        if @update_post.valid?
            @update_post.update(post_params)

            redirect_to post_path(@update_post)
        else  
            redirect_to edit_post_path(params[:id])
        end
    end

    def like
        @liked_post = Post.find(params[:id]).increase_likes
        @liked_post.save

        redirect_to post_path(params[:id])
    end

    def post_params
        params.require(:post).permit(:title, :content, :likes, :blogger_id, :destination_id)
    end
end
