class LaunchDiscussionWorkflow

  def initialize(discussion, host, participants=[])
    @discussion = discussion
    @host = host
    @participants = participants
  end

  # Expects @participants array to be filled with User objects
  def run
    return unless valid?
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