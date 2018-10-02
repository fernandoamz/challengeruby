class TodoMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.todo_mailer.task_pending.subject
  #
  def task_pending
    @user = User.find(1)
    @greeting = "Hi"

    mail to: @user.email, subject: "testing active mailer"
  end
end
