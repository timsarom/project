class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'

  def application_error(error)
  	@error = error
  	mail to: "Sam Ruby <depot@example.com>", subject: "Application error occured"
  end
end
