class MemesController < ApplicationController
  before_action :authenticate_user!, only: [:vote]
  respond_to :js, :json, :html

  def index
    @memes = Meme.all
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
    @meme = Meme.find(1)
  end

  def meme_params
    # *Strong params*: You need to *whitelist* what can be updated by the user
    # Never trust user data!
    params.require(:meme).permit(:title, :source, :photo)
  end
end
