class SearchController < ApplicationController
  def search
    @items = Item.search(search_params[:keyword])[0..9]
    @keyword = search_params[:keyword]
  end

  private

  def search_params
    params.require(:item).permit(:keyword)
  end
end
