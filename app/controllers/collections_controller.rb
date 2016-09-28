class CollectionsController < ApplicationController
  before_action :prepare_user, :except => [:create, :show]
  # before_action :prepare_collection_owner, :only => [:edit, :update, :destroy]
  before_action :prepare_collection, :except => [:index, :new, :create]

  def index
    @collections = Collection.all
  end

  def new
    @collection = Collection.new
  end

  def create
    @collection = Collection.new(collection_params)
    @collection.user_id = current_user.id
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
    # TODO Refactor
    redirect_to collections_path if !(@collection.user_id == current_user[:id])
  end

  def update
    # TODO Refactor
    redirect_to collections_path if !(@collection.user_id == current_user[:id])
    if @collection.update(collection_params)
      redirect_to collections_path
    else
      flash.now[:danger] = @collection.errors.full_messages
      render :new
    end
  end

  def destroy
    # TODO Refactor
    redirect_to collections_path if !(@collection.user_id == current_user[:id])
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

  def prepare_user
    require_user
  end

  # def prepare_collection_owner
  #   redirect_to collections_path if !(@collection.user_id == current_user[:id])
  # end
end
