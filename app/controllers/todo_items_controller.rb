class TodoItemsController < ApplicationController
  before_action :set_todo_list # checking and Assuring At First
  before_action :set_todo_item, except: [:create] # checking and Assuring At First
  def create
    @todo_item = @todo_list.todo_items.create(set_todo_item_params)
    redirect_to @todo_list
  end

  def destroy
    if @todo_item.destroy
      flash[:success] = 'Todo Item Is Successfully Deleted.'
    else
      flash[:error] = "Todo Item Is Couldn't Be Deleted."
        end
    redirect_to @todo_list
  end

  def complete
    @todo_item.update_attribute(:completed_at, Time.now)
    redirect_to @todo_list, notice: 'To-do Item Is Completed.'
  end

  private

  # Setting the Env for Todo_list
  def set_todo_list
    @todo_list = TodoList.find(params[:todo_list_id])
  end

  # Destroy_config test For Multiple Usuage
  def set_todo_item
    @todo_item = @todo_list.todo_items.find(params[:id])
  end

  # Setting For teh Todo_items in Todo_ist.included
  def set_todo_item_params
    params[:todo_item].permit(:content)
  end
end
