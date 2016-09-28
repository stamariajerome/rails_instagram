class CollectionsController < ApplicationController
  before_action :prepare_collection, :except => [:index, :new, :create]
  def index
    @collections = Collection.all
  end

  def new
    @collection = Collection.new
  end

  def create
    @collection = Collection.new(collection_params)
    if @collection.save
      redirect_to collections_path
    else
      flash.now[:danger] = @collection.errors.full_messages
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @collection.update(collection_params)
      redirect_to collections_path
    else
      flash.now[:danger] = @collection.errors.full_messages
      render :new
    end
  end

  def destroy
    @collection.destroy
    redirect_to collections_path
  end

  private
  def collection_params
    params.require(:collection).permit(:title, :url, :description)
  end

  def prepare_collection
    @collection = Collection.find(params[:id])
  end
end
