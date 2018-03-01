class Api::V1::SuperpowersController < ApiController
  def index
    render json: Entry.all
  end
