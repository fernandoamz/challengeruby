class SendPendingTaskJob < ApplicationJob
  queue_as :default

  def perform(*args)
    @users = User.all 

    @users.each do |user|
      mail = TodoMailer.task_pending(id: user.id, email: user.email)
      mail.deliver_now
    end
  end
end
