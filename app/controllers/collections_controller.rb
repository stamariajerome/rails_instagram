class CollectionsController < ApplicationController
  before_action :prepare_user, :except => [:create, :show]
  before_action :prepare_collection, :except => [:index, :new, :create]
  before_action :prepare_collection_owner, :only => [:edit, :update, :destroy]

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

      params[:collection][:category_ids].each do |category_id|
        CategoryCollection.create(:collection_id => @collection.id, :category_id => category_id) if !category_id.empty?
      end

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
      #
      # category_collections = CategoryCollection.where(:collection_id => params[:id])
      # category_ids = params[:collection][:category_ids].reject { |a| a.empty? }
      # category_collections.zip(category_ids) do |category_collection, category_id|
      #     category_collection.update(:category_id => category_id)
      # end

      # params[:collection][:category_ids].each do |category_id|
      #   category_collections = CategoryCollection.where(:collection_id => params[:id])
      #   category_collections.each do |category_collection|
      #     category_collection.update(:category_id => category_id) if !category_id.empty?
      #     logger.ap category_collection.collection_id.to_s + ' pinasok ang ' + category_id if !category_id.empty?
      #   end
      # end

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
    params.require(:collection).permit(:title, :url, :description, :category_ids => [])
    # params.require(:collection).permit(:title, :url, :description)
  end

  def prepare_collection
    @collection = Collection.find(params[:id])
  end

  def prepare_user
    require_user
  end

  def prepare_collection_owner
    if !(@collection.user[:id] == current_user[:id]) && !current_user.admin?
      redirect_to collections_path
    end
  end
end
