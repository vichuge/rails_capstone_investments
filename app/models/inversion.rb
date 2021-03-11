class Inversion < ApplicationRecord
  validates :author_id, :name, :amount, presence: true
  validates :amount, format: { with: /\A\d+(?:\.\d{2})?\z/ }

  belongs_to :author, class_name: :User, foreign_key: :author_id
  has_many :group_inversions
  has_many :groups, :through => :group_inversions
end
