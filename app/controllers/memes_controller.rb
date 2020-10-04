class MemesController < ApplicationController
  before_action :authenticate_user!, only: [:vote]
  respond_to :js, :json, :html

  def index
    @memes = Meme.all
    @meme = Meme.find(1)
  end

  def new
    @meme = Meme.new
  end

  def vote
  end

  def meme_params
    # *Strong params*: You need to *whitelist* what can be updated by the user
    # Never trust user data!
    params.require(:meme).permit(:title, :source)
  end
end
