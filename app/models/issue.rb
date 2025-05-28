class Issue < ApplicationRecord
  # Associations
  belongs_to :project
  belongs_to :user

  # Enums
  STATUSES = ['New', 'In Progress', 'In Review', 'Closed'].freeze

  # Validations
  validates :title, presence: true, length: { minimum: 5, maximum: 100 }
  validates :status, presence: true, inclusion: { in: STATUSES }
  validates :priority, presence: true,
                       numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: 5 }
end
