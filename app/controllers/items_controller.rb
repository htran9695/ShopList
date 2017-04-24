class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]


  def up
    @item = Item.find(params[:id])
    @item.move_higher
  end

  def down
    @item = Item.find(params[:id])
    @item.move_lower
  end

  def top
    @item = Item.find(params[:id])
    @item.move_to_top
  end

  def bottom
    @item = Item.find(params[:id])
    @item.move_to_bottom
  end


  # GET /items
  # GET /items.json
  def index
    @items = Item.all
  end

  # GET /items/1
  # GET /items/1.json
  def show
    @item = Item.find_by_id(params[:id])
  end

  # GET /items/new
  def new
    #@item = Item.new
    @list = List.find(params[:list_id])
    @item = @list.items.build
  end

  # GET /items/1/edit
  def edit
    @item = Items.find(params[:id])
  end

  # POST /items
  # POST /items.json
  def create
    @list = List.find(params[:list_id])
    @item = @list.items.create(item_params)

    if @item.save
      redirect_to list_path(@list)
    else
      render 'new'
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    @list = List.find(params[:list_id])
    @item = Item.find(params[:id])

    if @item.update(item_params)
      redirect_to list_path(@list)
    else
      render 'edit'
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @list = List.find(params[:list_id])
    @item = Item.find(params[:id])

    @item.destroy

    redirect_to list_path(@list)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:name, :description, :quantity, :list_id)
    end
end
