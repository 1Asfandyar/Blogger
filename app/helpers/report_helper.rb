# frozen_string_literal: true

# helper for like controller
module ReportHelper
  def reported?(user, post, type)
    Report.where(user_id: user.id, reportable_id: post.id, reportable_type: type).exists?
  end
end
