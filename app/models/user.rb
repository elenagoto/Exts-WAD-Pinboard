class User < ApplicationRecord
  # Validation rules
  validates :email, presence: true
end
