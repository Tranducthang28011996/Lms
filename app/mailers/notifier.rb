class Notifier < ActionMailer::Base

  include SendGrid

  sendgrid_category :use_subject_lines
  sendgrid_enable   :ganalytics, :opentrack

  default from: "lms@techmaster.com"

  def approve_course(_user, _course)
    sendgrid_category "Course Welcome"
    @_user = _user
    @_course = _course

    mail to: _user[:email], subject: "Welcome to course #{_course[:name]}"
  end

end