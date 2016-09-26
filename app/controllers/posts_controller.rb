class PostsController < ApplicationController
  def index
    @welcome_msg = "Hola Amigo!"
    @posts = PostsController.allposts
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
  end

  def new
  end

  def edit
  end

  def update
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
end
