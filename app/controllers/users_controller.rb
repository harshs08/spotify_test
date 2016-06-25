class UsersController < ApplicationController
  def index
    User.all
  end
  
  def show
    @user = current_user
    @playlists = @user.playlists if @user
  end

  def refresh_spotify_table
    @user = current_user
    @playlists = @user.playlists
    byebug
    respond_to do |format| 
      format.js
    end
  end
end
