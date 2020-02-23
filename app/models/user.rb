class User < ApplicationRecord
  # Validation rules
  validates :email, presence: true

  # Relationships
  has_many :pins
  has_many :comments
  has_and_belongs_to_many :images, class_name: 'Pin'
end
