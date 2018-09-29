class TodoListController < ApplicationController
    def index
        @todo_list = TodoList.where(id_usuario: current_user.id)

        respond_to do |format|
            format.html
            format.csv { send_data @todo_list.to_csv, filename: "users-#{Date.today}.csv" }
        end
    end

    def new 
        @todo_list = TodoList.new
    end
    
    def edit 
        @todo_list = TodoList.find(params[:id])
    end
    
    def create      
        @todo_list = TodoList.new(post_params.merge(:id_usuario => current_user.id, :done_homework => 0))
        
        if @todo_list.save
          redirect_to :action => :index
        else
          render 'new'
        end
    end

    def update        
        if TodoList.update(post_params.merge(:id_usuario => current_user.id, :done_homework => 0))
          redirect_to root_path
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

    def import_to_csv
        TodoList.import(params[:file])
        redirect_to root_url, notice: "Products imported."
    end

    private
    def post_params
        params.require(:todo_list).permit(:title, :description)
    end 
end
