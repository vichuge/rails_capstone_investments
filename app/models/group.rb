class Group < ApplicationRecord
  validates :user_id, :name, :icon, presence: true

  belongs_to :user
  has_many :group_inversions
  has_many :inversions, through: :group_inversions

  scope :alphabetical_order, -> { order(name: :asc) }
  scope :select_options, -> { all.map { |g| [g.name, g.id] }.unshift(['select a group...', 0]) }
end
