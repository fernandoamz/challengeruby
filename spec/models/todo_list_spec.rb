require 'rails_helper'

RSpec.describe TodoList, type: :model do
  let (:params) {{ title: 'test', description: 'test description', done_homework: 1, user_id: 2 }}

  context 'validations test' do
    it 'ensures title precense' do
      todo_list = TodoList.new(description: 'testing', done_homework: true).save
      expect(todo_list).to eq(false)
    end

    it 'ensures description precense' do
      todo_list = TodoList.new(title: 'testing', done_homework: true).save
      expect(todo_list).to eq(false)
    end

    it 'ensures insert is correctly' do
      todo_list = TodoList.new(params).save
      expect(todo_list).to eq(true)
    end

    it 'ensures that is validating relation' do
      todo_list = TodoList.new(title: 'testing', description: 'testing', done_homework: true).save
      expect(todo_list).to eq(false)
    end
  end 

  context 'ensures TodoList is saving' do 
    it 'ensures todo lists is saving' do
      todo_list_save = TodoList.new(params).save
      expect(todo_list_save).to eq(true)
    end
  end

  context 'review update TodoList' do
    it 'ensures that the TodoList is Updating content' do
      todo_list_update = TodoList.find(3).update(params)
      expect(todo_list_update).to eq(true)
    end
  end
end
