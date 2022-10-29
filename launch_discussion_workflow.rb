class LaunchDiscussionWorkflow

  # a discussion workflow requires a discussion object,
  # host user and a group of one or more participant users.
  def initialize(discussion, host, participants=[])
    @discussion = discussion
    @host = host
    @participants = participants
    @successful = false
    run()
  end

  # Expects @participants array to be filled with User objects.
  def run
    raise StandardError.new "You cannot run a discussion with no participants." unless valid?

    run_callbacks
  end

  def valid?
    return @participants.any?
  end

  # pretend we're in Rails and have access to the database abstraction layer.
  def run_callbacks(foo=nil)
    ActiveRecord::Base.transaction do
      discussion.save!
      create_discussion_roles!
      @successful = true
    end
  end

end