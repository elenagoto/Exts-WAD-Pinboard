class Comment < ApplicationRecord
  # Validation rules

  # Relationships
  belongs_to :pin
  belongs_to :user
end
