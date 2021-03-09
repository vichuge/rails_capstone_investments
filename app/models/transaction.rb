class Transaction < ApplicationRecord
  validates :author_id, :name, :amount, presence: true
  validates :amount, scale: 2

  belongs_to :user
  has_and_belongs_to_many :groups
end
