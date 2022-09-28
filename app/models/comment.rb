# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  belongs_to :parent, class_name: 'Comment', optional: true
  has_many :replies, class_name: 'Comment', foreign_key: :parent_id, dependent: :destroy
  has_one_attached :image, dependent: :destroy
  has_many :reports, as: :reportable, dependent: :destroy
  acts_as_votable

  validates :body, presence: true
end
