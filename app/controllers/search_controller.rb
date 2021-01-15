class SearchController < ApplicationController
  def search
    @items = Item.search(params[:keyword])
  end
end
