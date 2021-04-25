# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  validates(
    :title,
    length: {
      maximum: 80,
      message: 'Title can be at most 80 characters.'
    },
    presence: true
  )

  validates(
    :subtitle,
    length: {
      maximum: 160,
      message: 'Subtitle can be at most 160 characters.'
    },
    presence: true
  )

  validates :body, presence: true
end
