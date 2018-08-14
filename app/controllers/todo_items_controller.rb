class TodoItemsController < ApplicationController
    before_action :set_todo_list
def create
   @todo_item = @todo_list.todo_items.create(set_todo_item_params)
   redirect_to  @todo_list
end

def destroy
    @todo_item = @todo_list.todo_items.find(params[:id])
if @todo_item.destroy
       flash[:success] = "Todo Item Is Successfully Deleted."
    else
        flash[:error] = "Todo Item Is Couldn't Be Deleted."
    end
    redirect_to @todo_list
end

private
    # Setting the Env for Todo_list
    def set_todo_list
   @todo_list = TodoList.find(params[:todo_list_id])  
    end
    # Setting For teh Todo_items in Todo_ist.included
    def set_todo_item_params
    params[:todo_item].permit(:content)
    end
end
