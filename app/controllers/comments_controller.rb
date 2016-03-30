class CommentsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_link
  before_action :set_comment, only: [:show, :edit, :update, :destroy]


  def index
    @comments = Comment.all
  end

  def show
  end

  def new
    @comment = @link.comments.new
  end

  def create
    @comment = @link.comments.build(comment_params)
    if @comment.save
      redirect_to link_comments_path(@link)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @comment.update_attributes(comment_params)
      redirect_to @comments
    else
      render :edit
    end
  end

  def destroy
    @comment.delete
    redirect_to @comments
  end

  private

    def set_link
      @link = Link.find(params[:link_id])
    end

    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:author, :body)
    end
end
