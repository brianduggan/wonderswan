class CollectionsController < ApplicationController

  def index
    @collection = Collection.new
  end

  def new
    @collection = Collection.new
  end

  def create
    collection = Collection.create(collection_params)
    collection.update({user_id: current_user.id})
    if !collection.save
      flash[:error] = collection.errors.full_messages
      redirect_to :back
    else
      redirect_to user_collections_path(current_user)
    end
  end

  def show
    @collection = Collection.find(params[:id])
  end

  def collection
    game = game.find(params[:id])
    game.destroy
    redirect_to user_collections_path(current_user)
  end

  def destroy
    collection = Collection.find(params[:id])
    collection.destroy
    redirect_to user_collections_path(current_user)
  end

  private

  def collection_params
    params.permit(:name, :description)
  end

end
