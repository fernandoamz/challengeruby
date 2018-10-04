class TodoMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.todo_mailer.task_pending.subject
  #
  def task_pending(id: id, email: email)
    @todo_list_pending_homework = TodoList.where(id_usuario: id, done_homework: false)
    mail to: email, subject: "testing active mailer"
  end
end
