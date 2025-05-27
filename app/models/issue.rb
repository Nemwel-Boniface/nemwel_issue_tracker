class Issue < ApplicationRecord
  # Associations
  belongs_to :project
  belongs_to :user

  # Enums
  STATUSES = ["New", "In Progress", "In Review", "Closed"]

  # Validations
  validates :title, :status, :priority, presence: true
end
