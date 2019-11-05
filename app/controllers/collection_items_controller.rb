class CollectionItemsController < ApplicationController
  before_action :authenticate_user

  def index
    @items = current_user.collection_items.includes(:photo)
  end

  def create
    
    @item = current_user.collection_items.new(item_params)
    if @item.save
      render status: :created
    else
      render json: { errors: @item.errors }, status: :unprocessable_entity
    end
  end

def remove_item

  collection_item = CollectionItem.find_by(photo_id: params[:photo_id], user_id: current_user.id )
  collection_item.destroy
end

private

  def item_params
    params.require(:collection_item).permit(:photo_id)
  end
end

