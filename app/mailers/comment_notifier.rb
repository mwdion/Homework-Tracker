class CommentNotifier < ActionMailer::Base
  default from: "HWTracker@HWTracker.com"
  def comment_mail (transmit, user, content)
    @user = user
    @transmit = transmit
    @content = content
    mail(to: project.program.unit.users.map(&:email), subject: 'Comment Notification on HWTracker')
  end
end
