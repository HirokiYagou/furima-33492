class SearchController < ApplicationController
  def search
    binding.pry
    items = Item.search(search_params[:keyword])[0..9]
    keyword = search_params[:keyword]
    respond_to do |format|
      format.html
      format.json { render json: [posts, keyword]}
    end
  end

  private

  def search_params
    params.require(:item).permit(:keyword)
  end
end
