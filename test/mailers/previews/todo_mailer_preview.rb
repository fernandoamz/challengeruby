# Preview all emails at http://localhost:3000/rails/mailers/todo_mailer
class TodoMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/todo_mailer/task_pending
  def task_pending
    TodoMailer.task_pending
  end

end
