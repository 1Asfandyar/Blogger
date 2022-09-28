# frozen_string_literal: true

# helper for like controller
module PostHelper
  def published?(post)
    post.published?
  end
end
