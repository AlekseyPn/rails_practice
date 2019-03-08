# frozen_string_literal: true

class Blog < ApplicationRecord
  enum status: {
    draft: 0,
    published: 1
  }
  extend FriendlyId
  friendly_id :title, use: :slugged

  belongs_to :topic, optional: true
  has_many :comments, dependent: :destroy
  validates :title, :body, presence: true

  def self.recent
    order('created_at DESC')
  end
end
