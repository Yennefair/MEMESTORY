class MemesController < ApplicationController
  before_action :authenticate_user!, only: [:vote]
  respond_to :js, :json, :html

  def index
    @memes = Meme.all
    respond_to do |format|
      format.html
      format.json { render json: { memes: @memes.get_upvotes.size } }
    end
  end

  def new
    @meme = Meme.new
  end

  def show
    @meme = Meme.find(params[:id])
  end

  def create
    @meme = Meme.new(meme_params)
    if @meme.save
      redirect_to memes_path
    else
      render :new
    end
  end

  def vote
    if current_user.voted_for? @meme
      @meme.downvote_from current_user
    else
      @meme.vote_by current_user
    end
  end

private

  def meme_params
    # *Strong params*: You need to *whitelist* what can be updated by the user
    # Never trust user data!
    params.require(:meme).permit(:title, :source, :photo)
  end
end
