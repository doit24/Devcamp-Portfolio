# frozen_string_literal: true

# == Schema Information
#
# Table name: blogs
#
#  id         :integer          not null, primary key
#  title      :string
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  slug       :string
#  status     :integer          default("0")
#  topic_id   :integer
#

class Blog < ApplicationRecord
  enum status: { draft: 0, published: 1 }
  extend FriendlyId
  friendly_id :title, use: :slugged

  validates_presence_of :title, :body, :topic_id

  belongs_to :topic

  has_many :comments, dependent: :destroy

  def self.special_blogs
    all
  end

  def self.featured_blogs
    limit(2)
  end

  def self.recent
    order('created_at DESC')
  end
end
