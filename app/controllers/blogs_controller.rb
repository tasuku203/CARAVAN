class BlogsController < ApplicationController
  def index
    @blog = Blog.all
  end

  def show
    @blog= Blog.find(params[:id])
  end

  def new
    @blog = Blog.new
  end
  
  def create
    @blog=Blog.new(blog_params)
    if blog.save
      redirect_to blog_path(blog.id)
      blog = Blog.new(blog_params)
    else
      rendr :new
    end
  end

  def edit
    @blog=Blog.find(params[:id])
  end
  
  def update
    blog = Blog.find(params[:id])
    blog.update(blog_params)
    redirect_to blog_path(blog)
  end
    
  def destroy
    blog = Blog.finf(params[:id])
    blog.destroy(blog_params)
    redirect_to blog_path
  end
  
  
  private
  def blog_params
    params.repuire(:blog).permit(:title, :category, :body)
  end
  end
  