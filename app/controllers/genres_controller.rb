class GenresController < ApplicationController
  # before_action :set_genre

  def index
    @genres = Genre.includes(:questions).all.to_a
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  # def set_genre
  #   @genre = Genre.find(params[:id])
  # end

  # Never trust parameters from the scary internet, only allow the white list through.
  # def genre_params
  #  params.fetch(:genre, {})
  # end
end
