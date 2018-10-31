require 'csv'

class TodoList < ApplicationRecord
  validates :title,:description, presence: true
  belongs_to :user

  def self.to_csv
    attributes = %w{title description done_homework}

    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |todo_list|
        csv << attributes.map{ |attr| todo_list.send(attr) }
      end
    end
  end

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      todo_list_hash = row.to_hash
      todo_list = find_or_create_by!(title: todo_list_hash['title'], description: todo_list_hash['description'], done_homework: todo_list_hash['done_homework'])
      todo_list.update_attributes(todo_list_hash)
    end
  end

  scope :completed, -> { where(done_homework: true) }
  scope :pending, -> { where(done_homework: false) }

end
