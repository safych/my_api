class SingersController < ApplicationController
  before_action :set_singer, only: [:show, :update, :destroy]

  # GET /singers
  def index
    @singers = Singer.all

    render json: @singers
  end

  # GET /singers/1
  def show
    render json: @singer
  end

  # POST /singers
  def create
    if params[:age].to_i >= 5 and params[:age].to_i <= 80
      @singer = Singer.new(singer_params)
      if @singer.save
        render json: @singer, status: :created, location: @singer
      else
        render json: @singer.errors, status: :unprocessable_entity
      end
    else
      render status: 200, json: {
        error: "Некоректний вік співака!!!"
      }
    end
  end

  # PATCH/PUT /singers/1
  def update
    if @singer.update(singer_params)
      render json: @singer
    else
      render json: @singer.errors, status: :unprocessable_entity
    end
  end

  # DELETE /singers/1
  def destroy
    @singer.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_singer
      @singer = Singer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def singer_params
      params.require(:singer).permit(:name, :surname, :age, :status, :country, :group_id)
    end
end
