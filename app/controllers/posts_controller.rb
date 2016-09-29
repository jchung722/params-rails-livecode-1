class PostsController < ApplicationController
  def index
    # @welcome_msg = "Hola Amigo!"
    # @posts = PostsController.allposts
    # # render :layout => 'otherlayout' #switch to a different layout
    @posts = Post.all
  end

  def create
    @params = params
    @mypost = Post.new
    @mypost.title = params[:post][:title]
    @mypost.author = params[:post][:author]
    @mypost.body = params[:post][:body]
    @mypost.save
  end

  def show
    @posts = PostsController.allposts
    @mypost = nil

    @posts.each do |post|
      number = params[:id].to_i
      if post[:id] == number
        @mypost = post
      end
    end
    if @mypost == nil
      @mypost = {id: params[:id].to_i, title: "Did not find", body: ""}
      # render :file => 'public/404.html' #show error 404 page
      #     :status => :not_found, :layout => false
    end
  end

  def new
    @mypost = Post.new
  end

  def edit
    @posts = PostsController.allposts
    @mypost = nil

    @posts.each do |post|
      number = params[:id].to_i
      if post[:id] == number
        @mypost = post
      end
    end
    if @mypost == nil
      @mypost = {id: params[:id].to_i, title: "Did not find", body: ""}
      # render :file => 'public/404.html' #show error 404 page
      #     :status => :not_found, :layout => false
    end
  end

  def update
    @mypost[:title] = params["title"]
    @mypost[:author] = params["author"]
    @mypost[:body] = params["body"]
  end

  def destroy
  end

  def self.allposts
    [
      {id: 1, title: "My First Blog Post", author: "Dave Matthews", body: "Loren Ipsem"},
      {id: 2, title: "My Second Blog Post", author: "Dave Matthews", body: "This is the Body"},
      {id: 3, title: "My Third Blog Post", author: "Dave Matthews", body: "I get seen around Seattle a lot!"}
    ]
  end

  private
  def post_params
    params.require(:post).permit(:title, :author, :body)
  end
end
