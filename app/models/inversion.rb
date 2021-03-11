class Inversion < ApplicationRecord
  validates :author_id, :name, :amount, presence: true

  belongs_to :author, class_name: :User, foreign_key: :author_id
  has_many :group_inversions
  has_many :groups, :through => :group_inversions

  scope :ordered_by_most_recent, -> { order(created_at: :desc) }
end
