class SendPendingTaskJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
    @user = User.all

    @user.each do |user|
      mail = TodoMailer.task_pending(id: user.id, email: user.email)
      puts "**************************"
      puts mail
      puts "**************************"
      mail.deliver_now
    end
  end
end
