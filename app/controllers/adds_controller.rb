class AddsController < ApplicationController
  def create
    Add.create add_params
    redirect_to songs_path
  end

  private
    def add_params
      params.require(:add).permit(:song_id).merge(user: current_user)
    end
end
