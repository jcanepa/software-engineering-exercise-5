class LaunchDiscussionWorkflow

  def initialize(discussion, host, participants=[])
    @discussion = discussion
    @host = host
    @participants = participants
  end

  # Expects @participants array to be filled with User objects
  def run
    raise StandardError.new "You cannot run a discussion with no participants." unless valid?

    run_callbacks(:create) do
      ActiveRecord::Base.transaction do
        discussion.save!
        create_discussion_roles!
        @successful = true
      end
    end
  end

  def run_callbacks; end

end