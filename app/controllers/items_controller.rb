class ItemsController < ApplicationController
  respond_to :html, :js
  def new
    @item = Item.new
  end

  def create
      @item = current_user.items.build(item_params)
      if @item.save
      else
        flash[:error] = "Error adding item. Please try again."
      end
  end

  def destroy
    @item = Item.find(params[:id])
    if @item.destroy
      flash[:notice] = "Item removed from To-do list. Way to go!"
    else
      flash[:error] = "Error adding item. Please try again."
    end

  end

  private

  def item_params
    params.require(:item).permit(:name)
  end



end
