class SearchController < ApplicationController
  def index
    @facade = AirbenderFacade.new(params[:nation])
    require 'pry'; binding.pry
  end
end