class SendPendingTaskJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
    mail = TodoMailer.task_pending
    mail.deliver_now
  end
end
