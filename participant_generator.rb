class ParticipantGenerator

  def self.user_list_from_emails(email_list)
    participants = []

    for p in email_list do
      participants.append(
        User.create(email: p.downcase))
    end

    return participants
  end

end