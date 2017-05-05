class MailerJob < ApplicationJob
  queue_as :default

  def perform(_student, _course)
    # Do something later
    Notifier.approve_course(_student, _course).deliver_now
  end
end
