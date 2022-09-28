# frozen_string_literal: true

class Report < ApplicationRecord
  belongs_to :user
  belongs_to :reportable, polymorphic: true

  validates :user_id, uniqueness: { scope: %i[reportable_id reportable_type] }

  # scopes for report controller
  scope :destroy_report, ->(user, params) { user.reports.find_by(reportable_id: params[:id]) }
end
