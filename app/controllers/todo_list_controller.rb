class TodoListController < ApplicationController
  def index    
    @todo_list = TodoList.all
    @todo_list_done_homework = current_user.todo_lists.completed 
    @todo_list_pending_homework = current_user.todo_lists.pending

    respond_to do |format|
      format.html
      format.pdf do
        pdf = TodoListPdf.new(@todo_list)
        send_data pdf.render, filename: 'todo_lists.pdf', type: 'application/pdf', disposition: 'inline'
      end 

      format.csv { send_data @todo_list&.to_csv, filename: "todo_list_#{Date.today}.csv" }
    end
  end

  def new 
    @todo_list = TodoList.new
  end

  def edit 
    @todo_list = TodoList.find(params[:id])
  end

  def create      
    @todo_list = TodoList.new(todo_lists_params.merge(user_id: current_user.id))

    if @todo_list.save
      redirect_to action: 'index'
    else
      render 'new'
    end
  end

  def update        
    if TodoList.find(params[:id]).update(todo_lists_params.merge(user_id: current_user.id))
      redirect_to action: 'index'
    else
      render 'edit'
    end
  end

  def show
    @todo_list = TodoList.find(params[:id]) 
  end 

  def destroy
    @todo_list = TodoList.find(params[:id])
    @todo_list.destroy
    redirect_to root_path
  end

  private
  def todo_lists_params
    params.require(:todo_list).permit(:title, :description, :done_homework) 
  end 
end
