require 'disks_controller'
class SongsController < ApplicationController
  before_action :set_song, only: [:show, :update, :destroy]

  # GET /songs
  def index
    if params[:disk_id].present?
      @songs = Song.where("disk_id = ?", params[:disk_id])
    else
      @songs = Song.all
    end

    render json: @songs
  end

  # GET /songs/1
  def show
    render json: @song
  end

  def cleanup string
    string.titleize
  end

  # POST /songs
  def create
    disk = Disk.find_by(id: song_params[:disk_id])

    if disk.number_of_songs > 0
      @song = Song.new(song_params)
      if @song.save
        disk.number_of_songs -= 1
        disk.save
        render json: @song, status: :created, location: @song
      else
        render json: @song.errors, status: :unprocessable_entity
      end
    else
      render status: 200, json: {
        error: "Немає місця на диску!!!"
      }
    end
  end

  # PATCH/PUT /songs/1
  def update
    if @song.update(song_params)
      render json: @song
    else
      render json: @song.errors, status: :unprocessable_entity
    end
  end

  # DELETE /songs/1
  def destroy
    @song.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_song
      @song = Song.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def song_params
      params.require(:song).permit(:name, :text, :group_id, :disk_id)
    end
end
