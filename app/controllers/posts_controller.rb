class PostsController < ApplicationController

    before_action :fetch_post, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!, except: [:index, :show]
    
    def index
        @posts = Post.all.order('created_at DESC')
    end

    def new
        @post = Post.new
    end

    def create
        @post = Post.new post_params

        if @post.save
            redirect_to @post, notice: 'Successfully saved!'
        else
            render 'new', notice: 'Failed to save...'
        end
    end

    def show
    end

    def edit
    end

    def update
        if @post.update post_params
            redirect_to @post, notice: 'Successfully saved!'
        else
            render 'edit'
        end
    end

    def destroy
        @post.destroy
        redirect_to posts_path
    end

    private

    def fetch_post
        @post = Post.friendly.find(params[:id])
    end

    def post_params
        params.require(:post).permit(:title, :time, :snippet, :content, :slug)
    end
end
