class SearchController < ApplicationController
  def index
    @facade = AirbenderFacade.new(params[:nation])
  end
end