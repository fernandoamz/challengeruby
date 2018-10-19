class TodoListPdf < Prawn::Document
    def initialize(todo_list)
        super()
        @todo_list = TodoList.order('id DESC').all
        map_table
    end

    def map_table
        table get_table_info
    end

    def get_table_info 
        [['title', 'description', 'Done homework']] + 
        @todo_list.map do |todo| 
            [todo.title,todo.description,"#{todo.done_homework}"] 
        end
    end
end