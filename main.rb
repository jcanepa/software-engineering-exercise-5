# Exercise 5

# provided
require_relative 'launch_discussion_workflow'
# created for SRP
require_relative 'participants'
# added to make the exercise run-able
require_relative 'user'
require_relative 'devise'
require_relative 'discussion'

discussion = Discussion.new(title: "fake")
host = User.find(42)

attendee_email_list = [
  'fake1@example.com',
  'fake2@example.com',
  'fake3@example.com'
]

participants = []
for p in attendee_email_list do
  u = User.create(
    email: p.downcase,
    password: Devise.friendly_token)
  participants.append(u)
end

workflow = LaunchDiscussionWorkflow.new(discussion, host, participants)
workflow.run_callbacks