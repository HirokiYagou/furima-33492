class SearchController < ApplicationController
  def search
    # binding.pry
    @items = Item.search(search_params[:keyword])[0..9]
  end

  private

  def search_params
    params.require(:item).permit(:keyword)
  end
end
