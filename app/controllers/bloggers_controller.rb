class BloggersController < ApplicationController

    def index
        @bloggers = Blogger.all 
    end

    def show
        @blogger = Blogger.find(params[:id])
        @most_liked_post = Blogger.find(params[:id]).most_liked_post
    end

    def create
        @new_blogger = Blogger.new(blogger_params)
        
        if @new_blogger.valid?
            @new_blogger.save

            redirect_to blogger_path(@new_blogger)
        else  
            redirect_to new_blogger_path
        end
    end

    def new
        @blogger = Blogger.new
    end

    def blogger_params
        params.require(:blogger).permit(:name, :bio, :age)
    end
end
