class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'

  def application_error(exception)
  	@exception = exception
  	mail to: "Sam Ruby <depot@example.com>", subject: "Application error occured"
  end
end
