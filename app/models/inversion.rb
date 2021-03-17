class Inversion < ApplicationRecord
  validates :author_id, :name, :amount, presence: true

  belongs_to :author, class_name: :User, foreign_key: :author_id
  has_many :group_inversions
  has_many :groups, through: :group_inversions

  scope :ordered_by_most_recent, -> { order(created_at: :desc) }
  scope :total, ->(current_user) { where(author_id: current_user).sum('amount') }
  scope :externals, lambda { |current_user|
                      left_joins(:group_inversions).where('group_inversions is null', author_id: current_user)
                    }
  scope :in_a_group, ->(id) { joins(:group_inversions).where('group_inversions.group_id' => id) }
end
