# frozen_string_literal: true.
# Preview all emails at http://localhost:3000/rails/mailers/todo_mailer
class TodoMailerPreview < ActionMailer::Preview
  def task_pending
    TodoMailer.task_pending
  end
end
