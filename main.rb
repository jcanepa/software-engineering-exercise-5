# Exercise 5

# import classes required to run the exercise
require_relative 'user'
require_relative 'devise'
require_relative 'discussion'
require_relative 'launch_discussion_workflow'
require 'active_support/core_ext/object/blank'

discussion = Discussion.new(title: "fake")
host = User.find(42)
participants = "fake1@example.com\nfake2@example.com\nfake3@example.com"

workflow = LaunchDiscussionWorkflow.new(discussion, host, participants)
workflow.generate_participant_users_from_email_string
workflow.run_callbacks