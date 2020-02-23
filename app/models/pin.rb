class Pin < ApplicationRecord
  # Validation rules
  validates :title, presence: true
  validates :tag, length: { maximum: 30 }

  # Relationships
  belongs_to :user
  has_many :comments
  has_and_belongs_to_many :users

  # Methods
  def self.most_recent
    all.order(created_at: :desc).limit(6)
  end

  def self.search(search_term)
    where('title LIKE ?', "%#{search_term}%").or(where('tag LIKE ?', "%#{search_term}%"))
  end
end
