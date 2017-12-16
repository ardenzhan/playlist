class SongsController < ApplicationController

  def index
    redirect_to root_path unless session[:user_id]
    @songs = Song.all.order(created_at: :desc)
    @user = current_user
    
  end

  def create
    song = Song.new song_params
    unless song.save
      flash[:errors] = song.errors.full_messages
    end
    redirect_to songs_path
  end

  def show
    @song = Song.find(params[:id])

    @addusers = Song.find(params[:id]).added_users.group("id")

    @addcount = Song.find(params[:id]).added_users.group("id").count
  end

  private
    def song_params
      params.require(:song).permit(:artist, :title).merge(user: current_user)
    end
end
