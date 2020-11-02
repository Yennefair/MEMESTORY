class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :about]
  def home
  end

  def about
  end

  def dashboard
    @user = current_user
    @memes = Meme.all
    @mymemes = @memes.user
  end

  def settings
    @user = current_user
  end
end
