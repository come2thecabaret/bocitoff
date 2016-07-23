class ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def create
      @item = current_user.items.build(item_params)
      if @item.save
          redirect_to user_path(current_user)
      else
        flash[:error] = "Error adding item. Please try again."
        redirect_to user_path(current_user)
      end
  end

  def destroy
    @item = Item.find(params[:id])
    if @item.destroy
        flash[:notice] = "Item removed from To-do list. Way to go!"
        redirect_to authenticated_root_path
    else
      flash[:error] = "Error adding item. Please try again."
      redirect_to authenticated_root_path
    end
  end

  private

  def item_params
    params.require(:item).permit(:name)
  end



end
