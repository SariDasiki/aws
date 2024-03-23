class BlogsController < ApplicationController
  before_action :set_blog, only: %i[ show edit update destroy ]

  # GET /blogs or /blogs.json
  def index
    @blogs = Blog.all
  end


  def show
    @blog = Blog.find(params[:id])
  end


  def new
    @blog = Blog.new
  end

  
  def edit

  end

  
  def create
    @blog = Blog.new(blog_params)
      if @blog.save
       redirect_to @blog, notice: "Blog was successfully created." 
      else
      render :new
    end
  end

  # PATCH/PUT /blogs/1 or /blogs/1.json
  def update
      if @blog.update(blog_params)
        redirect_to @blog, notice: "Blog was successfully updated." 
      else
       render :edit
      end
  end

  def destroy
    @blog.destroy
     redirect_to blogs_url, notice: "Blog was successfully destroyed." 
  end

  private
    def set_blog
      @blog = Blog.find(params[:id])
    end

    def blog_params
      params.require(:blog).permit(:title, :content, :thumbnail)
    end
end
