class Project < ApplicationRecord
  # Associations
  belongs_to :user

  # Validations
  validates :title, :description, presence: true, length: { minimum: 5 }
end
