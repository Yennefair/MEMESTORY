class MemesController < ApplicationController
  before_action :set_meme, only: [:show, :edit, :update, :destroy, :upvote, :downvote]
  respond_to :js, :json, :html

  def index
    @memes = Meme.all
  end

  def new
    @meme = Meme.new
  end

  def show
  end

  def create
    @meme = Meme.new(meme_params)
    if @meme.save
      redirect_to memes_path
    else
      render :new
    end
  end

  def upvote
    @meme.upvote_from current_user
    respond_to do |format|
      format.json { render json: { meme: @meme.get_upvotes.size } }
      format.html
    end
  end

  def downvote
    @meme.downvote_from current_user
  end

 private

  def meme_params
    # *Strong params*: You need to *whitelist* what can be updated by the user
    # Never trust user data!
    params.require(:meme).permit(:title, :source, :photo)
  end
  def set_meme
    @meme = Meme.find(params[:id])
  end
end
