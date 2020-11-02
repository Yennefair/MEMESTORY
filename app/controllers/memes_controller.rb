class MemesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_meme, only: [:show, :edit, :update, :destroy, :upvote, :downvote]
  respond_to :js, :json, :html

  def index
    @memes = Meme.all
  end

  def new
    @meme = Meme.new
    @tagsnames = []
    Meme.tag_counts_on(:tags).each do |t|
      @tagsnames.append(t.name)
    end
    @all_tags = @tagsnames
  end

  def show
    @memeuser = @meme.user_id
    @memeuser = User.find(@memeuser)
    @memeuser = @memeuser.username
  end

  def create
    @meme = Meme.create(meme_params)
    if @meme.save
      redirect_to memes_path
    else
      render :new
    end
    @meme.user_id = current_user.id
  end

  def edit
    @meme = Meme.find(params[:id])
  end

  def update
    @meme = Meme.find(params[:id])
    @meme.update(meme_params)
    redirect_to meme_path(@meme)
  end

  def destroy
    @meme.destroy
    redirect_to memes_path
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
    params.require(:meme).permit(:title, :source, :photo, :user_id, :usertag_list, tag_list: [])
  end

  def set_meme
    @meme = Meme.find(params[:id])
  end
end
