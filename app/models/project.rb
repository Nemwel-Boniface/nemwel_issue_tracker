class Project < ApplicationRecord
  # FriendlyID for custom slugs
  extend FriendlyId
  friendly_id :title, use: :slugged

  # Associations
  belongs_to :user
  has_many :issues, dependent: :destroy

  # Validations
  validates :title, :description, presence: true, length: { minimum: 5 }

  # ensure that our slug is used in the URL instead of the default ID
  def to_param
    slug
  end
end
