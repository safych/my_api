class DisksController < ApplicationController
  before_action :set_disk, only: [:show, :update, :destroy]

  # GET /disks
  def index
    @disks = Disk.all

    render json: @disks
  end

  # GET /disks/1
  def show
    render json: @disk
  end

  # POST /disks
  def create
    @disk = Disk.new(disk_params)

    if @disk.save
      render json: @disk, status: :created, location: @disk
    else
      render json: @disk.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /disks/1
  def update
    if @disk.update(disk_params)
      render json: @disk
    else
      render json: @disk.errors, status: :unprocessable_entity
    end
  end

  # DELETE /disks/1
  def destroy
    @disk.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_disk
      @disk = Disk.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def disk_params
      params.require(:disk).permit(:name, :songs)
    end
end
