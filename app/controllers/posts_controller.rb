class PostsController < ApplicationController

    before_action :fetch_post, only: [:show]

    def index
        @posts = Post.all.order('created_at DESC')
    end

    def new
        @post = Post.new
    end

    def create
        @post = Post.new post_params

        if @post.save
            redirect_to @post
        else
            render 'new'
        end
    end

    def show

    end

    private

    def fetch_post
        @post = Post.find(params[:id])
    end

    def post_params
        params.require(:post).permit(:title, :content)
    end
end
