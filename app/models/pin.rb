class Pin < ApplicationRecord
  # Validation rules
  validates :title, presence: true
  validates :tag, length: { maximum: 30 }

  # Relationships
  belongs_to :user
  has_and_belongs_to_many :users
end
