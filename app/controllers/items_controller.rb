class ItemsController < ApplicationController
  before_action :set_list
  before_action :set_item, except: [:create]

  def create
    @item = @list.items.create(item_params)

    redirect_to @list
  end

  def destroy
    if @item.destroy
      flash[:success] = "Item successfully deleted."
    else
      flash[:error] = "Item could not be deleted."
    end

    redirect_to @list
  end

  def complete
    @item.toggle_completion
    
    redirect_to @list, notice: "Item completed."
  end

  private

  def set_list
    @list = List.find(params[:list_id])
  end

  def set_item
    @item = @list.items.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:content)
  end

end
