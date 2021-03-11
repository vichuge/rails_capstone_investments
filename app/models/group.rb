class Group < ApplicationRecord
  validates :user_id, :name, :icon, presence: true

  belongs_to :user
  has_many :group_inversions
  has_many :inversions, :through => :group_inversions
end
