class SpicesController < ApplicationController
  def index
    render json: Spice.all, status: :ok
  end

  def create
    spice = Spice.create(spice_params)
    render json: spice, status: :created
  end

  def update
    spice = Spice.find_by(id: params[:id])
    if spice
      spice.update(spice_params)
      render json: spice, status: :created
    else
      not_found
    end
  end

  def destroy
    spice = Spice.find_by(id: params[:id])
    if spice
      spice.destroy
      head :no_content
    else
      not_found
    end
  end

  private

  def not_found
    render json: { error: "Spice not found" }, status: :not_found
  end

  def spice_params
    params.permit(:title, :image, :description, :notes, :rating)
  end
end
