class PostsController < ApplicationController
  # GET /posts
  # GET /posts.json
  def index
    if session[:user_id]
      @posts = Post.all

      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @posts }
      end
    else
      redirect_to :controller => 'account', :action => 'login'
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    if session[:user_id]
      @post = Post.find(params[:id])

      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @post }
      end
    else
      redirect_to :controller => 'account', :action => 'login'
    end
  end

  # GET /posts/new
  # GET /posts/new.json
  def new
    if session[:user_id]
      @post = Post.new

      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @post }
      end
    else
      redirect_to :controller => 'account', :action => 'login'
    end
  end

  # GET /posts/1/edit
  def edit
    if session[:user_id]
      @post = Post.find(params[:id])
    else
      redirect_to :controller => 'account', :action => 'login'
    end
  end

  # POST /posts
  # POST /posts.json
  def create
    if session[:user_id]
      @post = Post.new(params[:post])

      respond_to do |format|
        if @post.save
          format.html { redirect_to @post, notice: 'Post was successfully created.' }
          format.json { render json: @post, status: :created, location: @post }
        else
          format.html { render action: "new" }
          format.json { render json: @post.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to :controller => 'account', :action => 'login'
    end
  end

  # PUT /posts/1
  # PUT /posts/1.json
  def update
    if session[:user_id]
      @post = Post.find(params[:id])

      respond_to do |format|
        if @post.update_attributes(params[:post])
          format.html { redirect_to @post, notice: 'Post was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @post.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to :controller => 'account', :action => 'login'
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    if session[:user_id]
      @post = Post.find(params[:id])
      @post.comments.each do |x|
        x.destroy
      end
      @post.destroy

      respond_to do |format|
        format.html { redirect_to posts_url }
        format.json { head :no_content }
      end
    else
      redirect_to :controller => 'account', :action => 'login'
    end
  end
end
