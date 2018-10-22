# frozen_string_literal: true
class TodoMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.todo_mailer.task_pending.subject
  #
  def task_pending(id, email)
    @todo_list_pending_homework = id.todo_lists.pending
    mail to: email, subject: 'You have the follow pending tasks'
  end
end
