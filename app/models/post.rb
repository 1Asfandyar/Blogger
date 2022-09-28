# frozen_string_literal: true

# main post model
class Post < ApplicationRecord
  include Hashid::Rails

  belongs_to :user
  has_rich_text :content
  acts_as_votable
  has_many :comments, dependent: :destroy
  has_many :reports, as: :reportable, dependent: :destroy
  has_many :suggestions, dependent: :destroy

  validates :title, :description, :content, presence: true
  validates :title, length: { in: 5..60 }
  validates :description, length: { in: 15..100 }
  validates :content, length: { minimum: 25 }

  # methods for post controllers

  def self.get_ordered_posts(user)
    if !user.user?
      Post.all.order({ published: :asc, created_at: :desc })
    else
      user.posts.all.order({ published: :asc, created_at: :desc })
    end
  end
end
