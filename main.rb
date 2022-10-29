# Exercise 5

require_relative 'launch_discussion_workflow'
require_relative 'user'
require_relative 'discussion'
require_relative 'participant_generator'

host_id = 42

# Use a list of emails to generate participant (Users)
attendee_email_list = [
  'fake1@example.com',
  'fake2@example.com',
  'fake3@example.com'
]
participants = ParticipantGenerator.user_list_from_emails(
  attendee_email_list)

workflow = LaunchDiscussionWorkflow.new(
  Discussion.new(title: "fake"),
  User.find(host_id),
  participants)

  workflow.run_callbacks
