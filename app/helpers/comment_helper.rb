# frozen_string_literal: true

# helper for like controller
module CommentHelper
  def get_name_from_email(email)
    email.split('@').first
  end
end
